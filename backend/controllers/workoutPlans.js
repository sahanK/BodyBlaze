const asyncHandler = require('../middleware/async');
const WorkoutPlan = require('../models/WorkoutPlan');

exports.getAllWorkoutPlans = asyncHandler(async (req, res, next) => {
  const workoutPlans = await WorkoutPlan.find();

  res.status(200).json({
    success: true,
    data: workoutPlans,
  });
});