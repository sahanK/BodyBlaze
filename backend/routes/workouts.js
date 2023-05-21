const express = require('express');
const router = express.Router();

const { getAllWorkouts } = require('../controllers/workouts');

router
  .get('', getAllWorkouts);

module.exports = router;