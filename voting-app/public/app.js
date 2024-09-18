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