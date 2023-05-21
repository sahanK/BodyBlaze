const mongoose = require('mongoose');

const WorkoutPlanSchema = new mongoose.Schema({
  name: String,
  description: String,
  image: String,
  duration: Number,
  workouts: [{
    name: String,
    reps: Number,
    bodyParts: [String],
    image: String,
    video: String,
  }],
});

module.exports = mongoose.model('WorkoutPlan', WorkoutPlanSchema, 'WorkoutPlans');