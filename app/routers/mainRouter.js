import express from 'express';

const mainRouter = express.Router();

// Routes
mainRouter.get('/', (req, res) => {
  res.render('home');
});

mainRouter.get('/about', (req, res) => {
  res.render('about');
});

mainRouter.get('/catalog', (req, res) => {
  res.render('catalog');
});

mainRouter.get('/contact', (req, res) => {
  res.render('contact');
});

export default mainRouter;
