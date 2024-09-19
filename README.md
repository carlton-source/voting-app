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
