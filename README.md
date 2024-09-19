# Project Overview

Building a backend system for a decentralized voting application. It will interact with the Stacks blockchain through a Clarity smart contract for voting, while the backend, built with Node.js, will handle authentication and API requests.

Certainly! Let’s create the **`documentation`** feature branch based on the comprehensive details provided throughout the project. This branch will include all necessary documentation to ensure clarity and usability for future developers and users.

## Setup

### Prerequisites

- Node.js (v14 or higher)
- Clarinet
- Stacks CLI

### Installation

1.  Clone the repository:
    ```bash
    git clone <repository-url>
    cd <repository-directory>
    ```
2.  Install backend dependencies:
    ```bash
    npm install
    ```
3.  Set up environment variables:
    - Create a `.env` file in the root directory and add required variables (e.g., `PRIVATE_KEY`, `CONTRACT_ADDRESS`).

### Running the Application

1.  Start the backend server:
    ```bash
    npm start
    ```
2.  Access the frontend at `http://localhost:3000`.

## Usage

- Submit a vote via the frontend or by making a POST request to `/voting/vote`.
- Fetch voting results by making a GET request to `/voting/results`.

## API Documentation

- **POST /voting/vote**: Submit a vote.
- **GET /voting/results**: Fetch current voting results.

## Smart Contract

- The smart contract is defined in `contracts/voting.clar`.

## Contributing

See `CONTRIBUTING.md` for guidelines.


### **Project Structure**

#### **Backend (Node.js) Directory Structure:**

```
/voting-app-backend
│
├── /src
│   ├── /controllers
│   │   ├── auth.js           # Authentication-related logic
│   │   ├── vote.js           # Handles vote submission and results retrieval
│   │
│   ├── /services
│   │   ├── clarityService.js  # Interactions with the Clarity contract via stacks.js
│   │
│   ├── /routes
│   │   ├── authRoutes.js      # Routes for authentication
│   │   ├── voteRoutes.js      # Routes for vote submission and results
│   │
│   ├── app.js                # Main Express app setup
│   ├── server.js             # Entry point to start the server
│
├── /tests
│   ├── vote.test.js          # Unit and integration tests for vote functionality
│   ├── auth.test.js          # Tests for authentication logic
│
├── package.json              # Project dependencies and scripts
├── .env                      # Environment variables (API keys, Stacks network details)
├── README.md                 # Documentation
└── Dockerfile                # Optional: Docker setup for containerizing the app
```

#### **Clarity Smart Contract Directory Structure:**

```
/voting-app-contract
│
├── contracts
│   ├── voting.clar           # Clarity smart contract for vote submission and tallying
│
├── tests
│   ├── voting_test.ts        # Tests for the Clarity contract logic
│
├── README.md                 # Documentation for deploying and interacting with the smart contract
```

---

### **Feature Branches**

I'll create the following branches to develop each feature independently before merging into the main branch:

1. **auth-integration**: Stacks Wallet OAuth2 authentication.
2. **clarity-contract**: Clarity smart contract for vote submission and tallying.
3. **vote-submission**: Backend logic for submitting votes to the blockchain.
4. **vote-results**: Backend logic for fetching and computing results from the blockchain.
5. **documentation**: Add comprehensive documentation for the project.

---

### **Step-by-Step Implementation**

#### **1. Setup Node.js Backend**

1. **Initialize the project**:
   ```bash
   mkdir voting-app-backend
   cd voting-app-backend
   npm init -y
   ```

2. **Install necessary dependencies**:
   ```bash
   npm install express dotenv stacks network stacks transactions
   npm install --save-dev jest supertest
   ```

3. **Create essential files**:
   - `server.js`: Entry point for the application.
   - `app.js`: Express configuration and middleware setup.
   - Routes, controllers, and services as per the structure outlined.

4. **Setup `.env` file** for environment variables:
   - **Stacks API URL**: Points to the Stacks Testnet or Mainnet.
   - **MongoDB connection string** (optional).
   - **PORT**: The port for running the Node.js server.

5. **Add Stacks Wallet OAuth2 authentication** (`auth.js`):
   - Implement the logic to authenticate users through the Stacks Wallet.
   - Store the user's wallet address to ensure voting uniqueness.

#### **2. Build the Clarity Smart Contract**

1. **Create the contract** (`voting.clar`):
   - Define the following functions:
     - **Submit vote**: Allows each authenticated user to cast a vote.
     - **Tally results**: Aggregates votes after the voting period ends.

2. **Deploy the contract** to the Stacks Testnet:
   - Use the **Stacks CLI** to deploy the contract:
     ```bash
     clarinet deploy contracts/voting.clar
     ```

3. **Test the contract** using **Clarinet**:
   - Write unit tests for the contract logic.
   - Test the contract's behavior when multiple votes are cast and ensure the one-vote-per-user restriction is enforced.

#### **3. Connect Backend to Clarity Smart Contract**

1. **Set up interactions with the contract** in the `clarityService.js`:
   - Use `stacks.js` to send transactions and interact with the deployed contract.
   - Implement functions for submitting votes and retrieving results.

2. **Handle vote submission** (`vote.js`):
   - Implement the `POST /vote` endpoint to submit a vote to the blockchain via the Clarity smart contract.
   - Ensure each authenticated user can only vote once.

3. **Retrieve results** (`results.js`):
   - Implement the `GET /results` endpoint to fetch and return the voting results from the blockchain.

#### **4. Add Testing and Continuous Integration**

1. **Set up unit tests** for the backend:
   - Test the API endpoints using Jest and Supertest.

2. **Write integration tests** for the Clarity contract:
   - Ensure all edge cases are covered, such as multiple votes and invalid submissions.

3. **Set up CI/CD**:
   - Use GitHub Actions or Travis CI for continuous integration to automatically run tests on each push or pull request.

#### **5. Deployment**

1. **Deploy the backend** to a cloud platform like **Heroku** or **AWS**.
   - Use Docker for containerization if needed (Dockerfile is already set up).

2. **Deploy the Clarity smart contract** to the Stacks Mainnet once everything is tested and verified on Testnet.

---

### **Documentation for Setup**

#### **Backend Setup:**

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/voting-app-backend.git
   cd voting-app-backend
   ```

2. **Install dependencies**:
   ```bash
   npm install
   ```

3. **Create `.env` file** with environment variables:
   ```bash
   PORT=3000
   STACKS_API_URL=https://stacks-node-api.testnet.stacks.co
   ```

4. **Run the server**:
   ```bash
   npm start
   ```

#### **Clarity Smart Contract Setup:**

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/voting-app-contract.git
   cd voting-app-contract
   ```

2. **Deploy the contract**:
   ```bash
   clarinet deploy contracts/voting.clar
   ```

3. **Run the tests**:
   ```bash
   clarinet test
   ```