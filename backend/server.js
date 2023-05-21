const express = require('express');
const dotenv = require('dotenv');
const errorHandler = require('./middleware/error');
const connectDB = require('./config/database');
const cors = require('cors');

// Load env
dotenv.config();

// Connect to MongoDB
connectDB();

// Route files
const workoutPlans = require('./routes/workoutPlans');

const app = express();

// Enable CORS
app.use(cors());
// Mount routers
app.use('/api/v1/workoutPlans', workoutPlans);

// Error handling middleware
app.use(errorHandler);

const PORT = process.env.PORT || 8080;

app.listen(PORT, () => {
  console.log(`Server running at port ${8080}`);
});
