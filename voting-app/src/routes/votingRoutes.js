const express = require('express');
const { vote, results } = require('../controllers/votingController');

const router = express.Router();

router.post('/vote', vote);
router.get('/results', results);

module.exports = router;
