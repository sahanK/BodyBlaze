const express = require('express');
const router = express.Router();

const { getAllWorkoutPlans } = require('../controllers/workoutPlans');

router
  .get('', getAllWorkoutPlans);

module.exports = router;