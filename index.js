import express from 'express';
import dotenv from 'dotenv/config';
import path from 'node:path';
import mainRouter from './app/routers/mainRouter.js';

const app = express();

// Moteur de template
app.set('view engine', 'ejs');
app.set('views', path.join(import.meta.dirname, "app", "views"));

// Middleware pour parser le corps des requêtes
app.use(express.urlencoded({ extended: true }));

// Middleware pour servir les fichiers statiques
app.use(express.static('public'))

// Routes
app.use(mainRouter);

// Middleware pour gérer les erreurs 404
app.use((req, res) => {
  res.status(404).render('404', { title: 'Page non trouvée' });
});

app.listen(process.env.PORT, () => {
  console.log(`🚀 listening at http://localhost:${process.env.PORT}`)
})