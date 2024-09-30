console.log(loggedIn);


var pwService = (function() {

	function modify(member, callback, error) {

		$.ajax({
			type: 'post',
			url: '/member/updatePw',
			data: JSON.stringify(member),
			contentType: 'application/json; charset=utf-8',
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
					console.log(result.message);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					console.log(er);
					error(er);
				}
			}
		});
	}
	return {
		modify: modify
	}
})();


if (!loggedIn) { // loggedIn이 false이면
	$("#myModal").modal("show"); // modal창 띄움 (로그인 필수)

	// modal창이 닫히면 실행
	$("#myModal").on("hidden.bs.modal", function() {
		// 홈으로 이동
		window.location.href = "/member/login";
	});
} else {
	$(document).ready(function() {
		var subBtn = $("#modify");
		var nickNameValid = false;
		subBtn.prop("disabled", true);
		$("#nickName").on("blur", function() {
			var nickName = $(this).val();
			$.ajax({
				url: "/member/checkNickName",
				type: "POST",
				data: { nickName: nickName },
				dataType: "json",
				success: function(response) {
					if (response.status === "error") {
						alert(response.message);
						nickNameValid = false; // 닉네임 검증 실패
					} else if (response.status === "success") {
						console.log(response.message);
						nickNameValid = true; // 닉네임 검증 성공
					}
					updateSubmitButtonState(); // 버튼 상태 업데이트
				},
				error: function(xhr, status, error) {
					console.error("AJAX Error: ", status, error);
					nickNameValid = false; // 닉네임 검증 실패
					updateSubmitButtonState(); // 버튼 상태 업데이트
				}
			});

		});

		function updateSubmitButtonState() { // 버튼 활성화하는 기능
			if (nickNameValid || loginMember === nickNameValid) { // 이메일, 닉네임값이 중복체크를 통과하면
				subBtn.prop("disabled", false); // 버튼 활성화
			} else {// 아니면
				subBtn.prop("disabled", true); // 하나라도 실패하면 버튼 비활성화
			}
		}


		$("button").on("click", function(e) {
			e.preventDefault(); // 기본 버튼 동작 방지
			// form 요소 찾기
			var form = $(this).closest("form");
			// 버튼의 id 찾기
			var btnId = $(this).attr("id");
			// 버튼id가 remove이면
			if (btnId === "remove") {
				// member/remove로 이동
				window.location.href = "/member/remove";
				// 버튼id가 home이면
			} else if (btnId === "home") {
				// 홈으로 이동
				window.location.href = "/";
			} else {
				var name = $("#name").val();
				var phone = $("#phone").val();
				var email = $("#email").val();
				var nickName = $("#nickName").val();

				var birth = $("#birth").val();
				if (name.length < 2
					|| name.length > 10) {
					alert("이름은 2자 이상 10자 이하 이어야 합니다.");
					return;
				}
				if (phone.length < 10
					|| phone.length > 11) {
					alert("핸드폰 번호는  10자 또는 11자이어야 합니다.");
					return;
				}
				if (email.length < 5
					|| email.length > 100) {
					alert("이메일 주소는 5자이상 또는 100자 이하 이어야 합니다.");
					return;
				}
				if (nickName.length < 3
					|| nickName.length > 30) {
					alert("닉네임은 3자이상 또는 10자 이하 이어야 합니다.");
					return;
				}

				if (birth.length !== 6) {
					alert("생년월일은 정확히 6자이어야 합니다.");
					return;
				}
				if (!name || !phone || !email
					|| !nickName || !birth) {
					alert("입력하지 않은 정보가 있습니다.");
					return;
				}
				form.submit();
			}
		});





	});
}