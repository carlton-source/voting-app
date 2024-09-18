const { AppConfig, UserSession } = require('@stacks/auth');

// Set up user session
const appConfig = new AppConfig(['store_write', 'publish_data']);
const userSession = new UserSession({ appConfig });

// Handle authentication logic
const authenticate = (req, res) => {
	if (!userSession.isUserSignedIn()) {
		const authURL = userSession.getAuthResponseToken();
		res.redirect(authURL);
	} else {
		const userData = userSession.loadUserData();
		res.json({ message: 'User signed in', userData });
	}
};

module.exports = { authenticate };
