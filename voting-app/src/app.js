const express = require('express');
const bodyParser = require('body-parser');
const dotenv = require('dotenv');
const authRoutes = require('./routes/authRoutes');

dotenv.config(); // Load environment variables

const app = express();
app.use(bodyParser.json()); // Middleware to parse JSON bodies
app.use('/auth', authRoutes); // Define /auth routes

app.get('/', (req, res) => {
	res.send('Welcome to the Voting App Backend');
});

module.exports = app; // Export the app