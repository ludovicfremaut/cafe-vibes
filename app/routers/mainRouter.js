import express from 'express';

const mainRouter = express.Router();

// Routes
mainRouter.get('/', (req, res) => {
  res.render('home');
});

export default mainRouter;
