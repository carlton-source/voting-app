const { submitVote, getResults } = require('../services/stacksService');

const vote = async (req, res) => {
	const { privateKey, candidateName } = req.body;

	try {
		const result = await submitVote(privateKey, candidateName);
		res.status(200).json({ message: 'Vote submitted successfully', result });
	} catch (error) {
		res.status(500).json({ error: 'Error submitting vote' });
	}
};

const results = async (req, res) => {
	try {
		const voteResults = await getResults();
		res.status(200).json(voteResults);
	} catch (error) {
		res.status(500).json({ error: 'Error fetching results' });
	}
};

module.exports = {
	vote,
	results,
};