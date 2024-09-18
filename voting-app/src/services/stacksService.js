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