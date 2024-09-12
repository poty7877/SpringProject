
$(document).ready(
	function() {

		checkModal(mno, result1);
		console.log(result1);
		console.log(mno);
		function checkModal(mno, result1) {
			if (result1 === '') {
				return;
			}
			if (parseInt(mno) > 0) {
				$(".modal-body").html(result1 + "님 회원가입을 축하드립니다.");
			}
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
			if (a_result > 0) {
				$(".modal-body").html(
					"예약에 성공하였습니다.");
			} else {
				return;
			}
			$("#myModal").modal("show");
		}
	});
