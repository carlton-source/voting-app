const express = require('express');
const { body } = require('express-validator'); // Import body from express-validator
const { authenticate, registerUser } = require('../controllers/auth'); // Ensure registerUser is imported

const router = express.Router();

// OAuth Routes
router.get('/login', authenticate);

// Registration Route
router.post(
	'/register',
	[
		// Validation middleware
		body('email').isEmail().withMessage('Please enter a valid email'),
		body('password').isLength({ min: 6 }).withMessage('Password must be at least 6 characters long'),
	],
	registerUser
);

module.exports = router;