import 'dotenv/config';
import cors from 'cors';
import express from 'express';
import authRouter, { usersRouter } from './modules/auth/router.js';
import carburantRouter from './modules/carburant/router.js';
import caisseRouter from './modules/caisse/router.js';
import clientsRouter from './modules/clients/router.js';
import fournisseursRouter from './modules/fournisseurs/router.js';
import banqueRouter from './modules/banque/router.js';
import boutiqueRouter from './modules/boutique/router.js';
import cartesRouter from './modules/cartes/router.js';
import entretienRouter from './modules/entretien/router.js';
import parametresRouter from './modules/parametres/router.js';
import rapportsRouter from './modules/rapports/router.js';
import referentielsRouter from './modules/referentiels/router.js';
import { config, isCorsOriginAllowed } from './lib/config.js';
import { errorHandler } from './middleware/error.js';

const app = express();
const port = config.PORT;

if (config.NODE_ENV === 'development' && config.CORS_ORIGIN.length === 0) {
  console.warn('CORS_ORIGIN is unset; allowing cross-origin requests in development.');
}

app.use(cors({
  origin: (origin, callback) => callback(null, isCorsOriginAllowed(origin)),
}));
app.use(express.json());
app.get('/health', (_request, response) => response.json({ status: 'ok' }));
app.use('/auth', authRouter);
app.use('/', usersRouter);
app.use('/', carburantRouter);
app.use('/carburant', carburantRouter);
app.use('/caisse', caisseRouter);
app.use('/', banqueRouter);
app.use('/', boutiqueRouter);
app.use('/', cartesRouter);
app.use('/', entretienRouter);
app.use('/entretien', entretienRouter);
app.use('/', parametresRouter);
app.use('/', rapportsRouter);
app.use('/', referentielsRouter);
app.use('/', clientsRouter);
app.use('/', fournisseursRouter);
app.use(errorHandler);

app.listen(port, () => {
  console.log(`Station Service API running on http://localhost:${port}`);
});
