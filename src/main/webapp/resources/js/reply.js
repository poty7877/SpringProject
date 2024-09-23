/**
 *  댓글 ajax 처리용 javaScript 파일 입니다.
	  reply.js는 ajax 호출을 담당
 */


console.log("댓글용 모듈 실행중.....");

var replyService = (function() {

	function add(reply, callback, error) {
		console.log("댓글추가용 함수.....")  // add함수는 ajax를 이용해서 post방식으로 호출하는 코드를 작성함.

		$.ajax({  // ajax호출이 성공하고, callback값으로 적절한 함수가 존재한다면 해당 함수를 호출해서 결과를 반영하는 방식
			type: 'post',  						// @PostMapping
			url: '/replies/new', 				// http://localhost:80/replies/new
			data: JSON.stringify(reply), 		// Json으로 받아 객체로 넘김
			contentType: "application/json; charset=utf-8",  // <- 전송타입
			success: function(result, status, xhr) { // 위 코드 성공시 함수
				// result : 결과
				// status : 200 | 500
				// xhr : xmlHttpRequest 객체(서블릿에서 요청 객체와 유사함.)
				if (callback) {  // callback = true 이면 아래 코드 실행
					callback(result);
				} // callback if end										
			}, // success end
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				} // error if end
			} // error end

		}); // ajax end
	} // function add end

	function getList(param, callback, error) {
		// getList()는 param이라는 개체를 통해서 필요한 파라미터를 전달받아 JSON 목록을 호출
		// URL 호출시 확장자를 '/.json' 으로 요구함.
		var resNum = param.resNum;
		var page = param.page || 1;

		$.getJSON("/replies/pages/" + resNum + "/" + page + ".json",
			function(data) {
				if (callback) {
					//	callback(data);  // 댓글 목록만 가져오는 경우
					callback(data.replyCnt, data.list);   // 댓글 숫자와 목록을 가져오는 경우
				} // if end
			}).fail(function(xhr, status, err) { // $.getJSON end  function(data) end
				if (error) {
					error();
				} // if end				
			}); // fail(function(xhr, status, err) end
	} // function getList() end

	function remove(rno, callback, error) {  // remove()는 delete 방식으로 데이터를 전달하므로, $.ajax()를 이용해서 구체적으로 type속성으로 'delete'를 지정함.
		$.ajax({
			type: 'delete',
			url: '/replies/' + rno,
			success: function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}// if end
			}, // success end
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				} // if end
			} // error end			
		}); // ajax end
	} // function remove() end

	function update(reply, callback, error) {

		console.log("RNO : " + reply.rno);

		$.ajax({
			type: 'put',
			url: '/replies/' + reply.rno,
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				} // if end
			}, // success end 
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				} // if end
			} // error end			
		});  // ajax end		
	} // function update() end

	function get(rno, callback, error) {

		$.get("/replies/" + rno + ".json", function(result) {
			if (callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) { //$.get("/replies/" + rno + ".json", function(result) end
			if (error) {
				error();
			} // if end
		});  //fail(function(xhr, status, err) end
	} // function get() end 

	function displayTime(timeValue) {
		// displayTime()은 ajax에서 데이터를 가져와서 HTML을 만들어 주는 부분에 'replyService.displayTime(list[i].replyDate)'의 형태로 적용하도록 함.

		var today = new Date();

		var gap = today.getTime() - timeValue;

		var dateObj = new Date(timeValue);
		var str = "";

		if (gap < (1000 * 60 * 60 * 24)) { //1000*60*60*24 = 24h

			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();


			return [(hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
				':', (ss > 9 ? '' : '0') + ss].join('');
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();

			return [yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd].join('');
		} // if end

	}; // function displayTime() end




	return {
		add: add,
		get: get,
		getList: getList,
		remove: remove,
		update: update,
		displayTime: displayTime

	};   // return end
})();  // 변수 생성 // ( function(){} return문 )(실행문); -> 즉시실행함수


