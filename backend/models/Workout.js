const mongoose = require('mongoose');

const WorkoutSchema = new mongoose.Schema({
  name: String,
  reps: Number,
  bodyParts: [String],
  image: String,
  video: String,
});

module.exports = mongoose.model('Workout', WorkoutSchema, 'Workouts');