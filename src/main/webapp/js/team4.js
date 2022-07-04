//	JavaScript Ajax 구현
//	XMLHttpRequest: JavaScript 객체로 http를 통한 데이터 송수신을 지원해주는 객체 => XHR
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

//	Ajax 요청이 완료되면 실행되는 함수
function searchProcess() {
	// console.log('searchFunction() 함수에서 요청한 Ajax가 완료되면 자동으로 실행되는 함수');

	// XMLHttpRequest 객체의 readyState
	// 0: 아직 실행되지 않음
	// 1: 로딩중
	// 2: 로딩됨
	// 3: 통신중
	// 4: 통신완료
	// console.log('readyState: ', searchRequest.readyState)

	// XMLHttpRequest 객체의 status
	// 200: 수신성공
	// 3xx: 금지
	// 4xx: 페이지없음
	// 5xx: 서버오류
	// console.log('status: ', searchRequest.status)

	// 통신이 정상적으로 완료 되어음을 확인하고 필요한 작업을 실행한다.
	if (searchRequest.readyState == 4 && searchRequest.status == 200) {
		// console.log('responseText: ', searchRequest.responseText);

		// 서블릿에서 리턴된 문자열을 JavaScript 객체로 변환하기 위해 괄호를 붙여 eval() 함수로
		// 실행해서 객체에 저장한다.
		let object = eval('(' + searchRequest.responseText + ')');
		// console.log(object);
		// JavaScript 객체에서 result 라는 key에 할당된 데이터를 얻어온다. => 화면에 출력할 데이터
		let result = object.result;
		// console.log(result);

		// 서블릿에서 수신한 데이터를 출력하기 위해 <tbody> 태그를 얻어온다.
		let table = document.getElementById('ajaxTable');
		// 새로 검색되는 데이터가 표시되어야 하므로 이전에 <tbody> 태그에 들어있던 내용은 지운다.
		table.innerHTML = '';

		// 데이터의 개수만큼 반복하며 테이블에 행을 만들어 추가한다.
		for (let i = 0; i < result.length; i++) {
			// <tbody>에 넣어줄 행을 만든다.
			let row = table.insertRow(i);
			// 한 행에 출력할 열의 개수만큼 반복하며 행에 열을 추가한다.
			for (let j = 0; j < result[i].length; j++) {
				// 행에 넣어줄 열을 만든다.
				let cell = row.insertCell(j);
				// 열에 화면에 표시할 데이터를 넣어준다.
				cell.innerHTML = result[i][j].value;
			}
		}
	}
}

//	페이지가 로드되자마자 화면에 전체 데이터가 보여지게 하기 위해서 onload 이벤트에서 
//	searchFunction() 함수를 실행한다.
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










