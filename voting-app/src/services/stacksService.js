const {
	makeContractCall,
	broadcastTransaction,
	AnchorMode,
	uintCV,
	bufferCV,
	PostConditionMode,
} = require('@stacks/transactions');
const { StacksTestnet } = require('@stacks/network');
const axios = require('axios');
const { privateKey } = process.env;

const { StacksTestnet } = require('@stacks/network');

const network = new StacksTestnet();

const submitVote = async (voterPrivateKey, candidateName) => {
	const contractAddress = process.env.CONTRACT_ADDRESS;
	const contractName = process.env.CONTRACT_NAME;
	const functionName = 'submit-vote';

	const candidateNameBuff = bufferCV(Buffer.from(candidateName));

	const txOptions = {
		contractAddress,
		contractName,
		functionName,
		functionArgs: [candidateNameBuff],
		senderKey: voterPrivateKey,
		network,
		postConditionMode: PostConditionMode.Allow,
		anchorMode: AnchorMode.Any,
	};

	try {
		const transaction = await makeContractCall(txOptions);
		const broadcastResponse = await broadcastTransaction(transaction, network);
		return broadcastResponse;
	} catch (error) {
		console.error('Error submitting vote:', error);
		throw error;
	}
};