const express = require('express');
const { authenticate } = require('../controllers/auth');

const router = express.Router();

router.get('/login', authenticate);

module.exports = router;
