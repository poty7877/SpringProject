
$(document).ready(
	function() {

		checkModal(mno, result1);
		function checkModal(mno, result1) { // Controller에서 보낸 mno와 result를 받아서 실행
			if (result1 === '') { // result값이 null이면 return
				return;
			}
			if (parseInt(mno) > 0) { // mno값이 0보다 크면
				// Controller에서 받아온 result값을 이용해 modal-body의 내용을 변경
				$(".modal-body").html(result1 + "님 회원가입을 축하드립니다.");
			}
			// Modal창 띄움
			$("#myModal").modal("show");
		}

		loginModal(result2);
		console.log(result2);
		function loginModal(result2) {
			if (result2 === '') {
				return;
			} else {
				$(".modal-body").html(result2 + "님 환영합니다.");
			}
			$("#myModal").modal("show");
		}


		modifyModal(result3);
		console.log(result3);
		function modifyModal(result3) {
			if (result3 === "") {
				return;
			} else if (result3 === "success") {
				$(".modal-body").html("정보가 성공적으로 수정 되었습니다.");
			}
			$("#myModal").modal("show");
		}


		deleteModal(result4);
		console.log(result4);
		function deleteModal(result4) {
			if (result4 === "") {
				return;
			} else if (result4 === "success") {
				$(".modal-body").html("회원 탈퇴되었습니다. 감사합니다.");
			}
			$("#myModal").modal("show");
		}


		findModal1(result5);
		console.log(result5);
		function findModal1(result5) {
			if (result5 === "") {
				return;
			} else {
				$(".modal-body").html(
					"회원님의 이메일은 " + result5 + "입니다");
			}
			$("#myModal").modal("show");
		}


		findModal2(result6);
		console.log(result6);
		function findModal2(result6) {
			if (result6 === "") {
				return;
			} else {
				$(".modal-body").html(
					"회원님의 임시 비밀번호는 " + result6 + "입니다\n"
					+ "로그인 후 비밀번호를 변경해주세요");
			}
			$("#myModal").modal("show");
		}


		A_Modal(a_result);
		console.log(a_result);
		function A_Modal(a_result) {
			if (a_result === "") {
				return;
			} else {
				$(".modal-body").html(a_result);

			}
			$("#myModal").modal("show");
		}


		console.log(result7);
		delRest(result7);
		function delRest(result7) {
			if (result7 === "") {
				return;
			} else {
				$(".modal-body").html("회원탈퇴가 완료되었습니다.\n 감사합니다");
				$("#myModal").modal("show");
			}
			$("#myModal").modal("show");
		}




	});
