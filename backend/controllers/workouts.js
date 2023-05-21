const asyncHandler = require('../middleware/async');
const Workout = require('../models/Workout');

exports.getAllWorkouts = asyncHandler(async (req, res, next) => {
  const workouts = await Workout.find();

  res.status(200).json({
    success: true,
    data: workouts,
  });
});