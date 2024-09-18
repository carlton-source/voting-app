document.getElementById('voteForm').addEventListener('submit', async function (event) {
	event.preventDefault();

	const privateKey = document.getElementById('privateKey').value;
	const candidateName = document.getElementById('candidateName').value;

	try {
		const response = await fetch('/voting/vote', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({ privateKey, candidateName })
		});

		const data = await response.json();
		alert('Vote submitted successfully!');
		console.log(data);
	} catch (error) {
		console.error('Error submitting vote:', error);
		alert('Error submitting vote');
	}
});

document.getElementById('fetchResultsBtn').addEventListener('click', async function () {
	try {
		const response = await fetch('/voting/results');
		const results = await response.json();

		const resultsList = document.getElementById('resultsList');
		resultsList.innerHTML = '';

		results.forEach(result => {
			const listItem = document.createElement('li');
			listItem.textContent = `${result.name}: ${result.votes} votes`;
			resultsList.appendChild(listItem);
		});
	} catch (error) {
		console.error('Error fetching results:', error);
		alert('Error fetching results');
	}
});