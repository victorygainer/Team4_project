//	JavaScript Ajax 구현
const searchRequest = new XMLHttpRequest(); // 검색용
const insertRequest = new XMLHttpRequest(); // 입력용

//	Ajax 검색 요청 함수
function searchFunction() {
	// console.log('searchFunction()');
	// console.log(document.getElementById('username').value);
	// XMLHttpRequest객체.open('요청방식', '요청주소', 동기방식), 동기방식: 동기식 => false, 비동기식 => true
	// encodeURIComponent(): 문자열을 유니코드(UTF-8)로 인코딩 한다.

	// GET 방식 요청
	let url = './AjaxSearch?name=' + encodeURIComponent(document.getElementById('username').value);
	searchRequest.open('GET', url, true);
	// send() 함수로 서버에 요청한다.
	// 데이터를 url의 일부인 쿼리 스트링(?~~~~~)으로 전송할 경우 send() 함수의 인수로 null을 쓴다.
	searchRequest.send(null);

	// POST 방식 요청
	// let url = './AjaxSearch'; // url에 쿼리 스트링을 사용하지 않는다.
	// searchRequest.open('POST', url, true);
	// setRequestHeader() 함수로 반드시 헤더 정보를 포함 시켜야 한다. => POST 방식은 정보가 헤더에 담겨서 넘어간다.
	// searchRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	// 데이터를 send() 함수의 인수로 전달한다.
	// searchRequest.send('name=' + encodeURIComponent(document.getElementById('username').value));

	// console.log(url);

	// onreadystatechange: Ajax 요청이 완료되면 실행할 콜백 함수를 지정한다.
	searchRequest.onreadystatechange = searchProcess; // ()를 쓰면 안된다.
}

//	Ajax 요청이 완료 시 실행
function searchProcess() {
	// console.log('searchFunction()');
	if (searchRequest.readyState == 4 && searchRequest.status == 200) {
		// console.log('responseText: ', searchRequest.responseText);
		let object = eval('(' + searchRequest.responseText + ')');
		// console.log(object);
		let result = object.result;
		// console.log(result);

		// 데이터 출력 테이블
		let table = document.getElementById('ajaxTable');
		// 새로 검색되는 데이터가 표시되어야 하므로 이전에 <tbody> 태그에 들어있던 내용은 지운다.
		table.innerHTML = '';

		for (let i = 0; i < result.length; i++) {
			// <tbody>에 넣어줄 행을 만든다.
			let row = table.insertRow(i);
			for (let j = 0; j < result[i].length; j++) {
				let cell = row.insertCell(j);
				cell.innerHTML = result[i][j].value;
			}
		}
	}
}

onload = function() {
	searchFunction();
}

//	Ajax 입력 요청 함수
function insertFunction() {
	// console.log('insertFunction()');
	let url = './AjaxInsert?name=' + encodeURIComponent(document.getElementById('name').value)
		+ '&age=' + encodeURIComponent(document.getElementById('age').value)
		+ '&gender=' + encodeURIComponent($('input[name=gender]:checked').val())
		+ '&email=' + encodeURIComponent(document.getElementById('email').value);
	console.log(url);
	insertRequest.open('GET', url, true);
	insertRequest.send(null);
	insertRequest.onreadystatechange = insertProcess;
}

function insertProcess() {
	//	console.log('insertProcess()');

	if (insertRequest.readyState == 4 && insertRequest.status == 200) {
		let result = insertRequest.responseText;
		//	저장 여부와 관계없이 텍스트 상자의 내용을 지운다.
		document.getElementById('name').value = '';
		document.getElementById('age').value = '';
		document.getElementById('email').value = '';
		document.getElementById('username').value = '';
		if (result == 1) {
			alert('저장 성공');
			searchFunction();
		} else {
			alert('저장 실패')
		}
	}
}










