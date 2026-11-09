import assert from 'node:assert/strict';
import { describe, it } from 'node:test';
import './test-env.js';
import { isCorsOriginAllowed, loadConfig } from '../src/lib/config.js';

describe('config validation', () => {
  it('accepts a valid environment', () => {
    const config = loadConfig({
      DB_HOST: '127.0.0.1',
      DB_USER: 'station',
      DB_PASSWORD: 'strong-password-123',
      DB_NAME: 'station_service_test',
      DB_PORT: '3306',
      JWT_SECRET: 'this-is-a-valid-secret-value-32chars',
      PORT: '4000',
    });

    assert.equal(config.DB_HOST, '127.0.0.1');
    assert.equal(config.JWT_SECRET, 'this-is-a-valid-secret-value-32chars');
  });

  it('rejects a short JWT secret without leaking the original value', () => {
    const shortSecret = 'short-secret';

    try {
      loadConfig({
        DB_HOST: '127.0.0.1',
        DB_USER: 'station',
        DB_PASSWORD: 'strong-password-123',
        DB_NAME: 'station_service_test',
        DB_PORT: '3306',
        JWT_SECRET: shortSecret,
        PORT: '4000',
      });
      throw new Error('Expected loadConfig to reject an invalid env');
    } catch (error) {
      const message = String(error);
      assert.match(message, /JWT_SECRET/);
      assert.doesNotMatch(message, new RegExp(shortSecret.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')));
    }
  });

  it('allows an origin in the configured CORS allowlist', () => {
    const config = loadConfig({
      DB_HOST: '127.0.0.1',
      DB_USER: 'station',
      DB_PASSWORD: 'strong-password-123',
      DB_NAME: 'station_service_test',
      JWT_SECRET: 'this-is-a-valid-secret-value-32chars',
      CORS_ORIGIN: 'https://app.example, https://admin.example',
    });

    assert.equal(isCorsOriginAllowed('https://admin.example', config), true);
  });

  it('rejects an origin outside the configured CORS allowlist', () => {
    const config = loadConfig({
      DB_HOST: '127.0.0.1',
      DB_USER: 'station',
      DB_PASSWORD: 'strong-password-123',
      DB_NAME: 'station_service_test',
      JWT_SECRET: 'this-is-a-valid-secret-value-32chars',
      CORS_ORIGIN: 'https://app.example',
    });

    assert.equal(isCorsOriginAllowed('https://untrusted.example', config), false);
  });

  it('rejects cross-origin requests when CORS_ORIGIN is unset in production', () => {
    const config = loadConfig({
      DB_HOST: '127.0.0.1',
      DB_USER: 'station',
      DB_PASSWORD: 'strong-password-123',
      DB_NAME: 'station_service_test',
      JWT_SECRET: 'this-is-a-valid-secret-value-32chars',
      NODE_ENV: 'production',
    });

    assert.equal(isCorsOriginAllowed('https://untrusted.example', config), false);
    assert.equal(isCorsOriginAllowed(undefined, config), true);
  });

  it('allows cross-origin requests when CORS_ORIGIN is unset in development', () => {
    const config = loadConfig({
      DB_HOST: '127.0.0.1',
      DB_USER: 'station',
      DB_PASSWORD: 'strong-password-123',
      DB_NAME: 'station_service_test',
      JWT_SECRET: 'this-is-a-valid-secret-value-32chars',
      NODE_ENV: 'development',
    });

    assert.equal(isCorsOriginAllowed('http://localhost:5173', config), true);
  });
});
