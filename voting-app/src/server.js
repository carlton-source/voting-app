const app = require('./app'); // Import the app
const cookieParser = require('cookie-parser'); // Import cookie-parser

app.use(cookieParser()); // Use cookie-parser middleware

const PORT = process.env.PORT || 3000; // Define the port
app.listen(PORT, () => {
	console.log(`Server is running on port ${PORT}`);
});