
$(document).ready(function() {
	var $subBtn = $("#subBtn");
	var emailValid = false;
	var nickNameValid = false;
	$subBtn.prop("disabled", true);
	$("#email").on("blur", function() {
		var email = $(this).val();
		$.ajax({
			url: "/member/checkEmail",
			type: "POST",
			data: { email: email },
			dataType: "json",
			success: function(response) {
				if (response.status === "error") {
					alert(response.message);

					emailValid = false; // 이메일 검증 실패


				} else if (response.status === "success") {
					console.log(response.message);
					emailValid = true; // 이메일 검증 성공
				}
				updateSubmitButtonState(); // 버튼 상태 업데이트
			},
			error: function(xhr, status, error) {
				console.error("AJAX Error: ", status, error);
				emailValid = false; // 이메일 검증 실패
				updateSubmitButtonState(); // 버튼 상태 업데이트
			}
		});

	});

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
	function updateSubmitButtonState() {
		if (emailValid && nickNameValid) {
			$subBtn.prop("disabled", false); // 둘 다 성공했으면 버튼 활성화
		} else {
			$subBtn.prop("disabled", true); // 하나라도 실패하면 버튼 비활성화
		}
	}
	$("#myForm").on("submit", function(e) {
		var emailMessage = $("#emailMessage").text();
		var pw = $("#pw").val();
		var cpw = $("#cpw").val();



		if (pw !== cpw) {
			e.preventDefault();
			alert("비밀번호가 다릅니다.");
			return;
		}

		var name = $("#name").val();
		var phone = $("#phone").val();
		var email = $("#email").val();
		var nickName = $("#nickName").val();
		var birth = $("#birth").val();

		if (name.length < 2 || name.length > 10) {
			e.preventDefault();
			alert("이름은 2자 이상 10자 이하 이어야 합니다.");
			return;
		}
		if (phone.length < 10 || phone.length > 11) {
			e.preventDefault();
			alert("핸드폰 번호는 10자 또는 11자이어야 합니다.");
			return;
		}
		if (email.length < 5 || email.length > 100) {
			e.preventDefault();
			alert("이메일 주소는 5자 이상 또는 100자 이하 이어야 합니다.");
			return;
		}
		if (nickName.length < 2 || nickName.length > 10) {
			e.preventDefault();
			alert("닉네임은 2자 이상 10자 이하 이어야 합니다.");
			return;
		}
		if (pw.length < 6 || pw.length > 16) {
			e.preventDefault();
			alert("비밀번호는 6자 이상 16자 이하 이어야 합니다.");
			return;
		}
		if (birth.length !== 6) {
			e.preventDefault();
			alert("생년월일은 정확히 6자이어야 합니다.");
			return;
		}
		if (!name || !phone || !email || !nickName || !pw || !cpw || !birth) {
			e.preventDefault();
			alert("입력하지 않은 정보가 있습니다.");
			return;
		}
	});
});
