
$(document).ready(function() {
	var $subBtn = $("#subBtn");
	var emailValid = false;
	var emailInput = $("#email");
	var emailError = $("#emailError");
	var nickNameValid = false;
	var nickNameInput = $("#nickName");
	var nickNameError = $("#nickNameError");
	var pwValid = false;
	var pwInput = $("#pw");
	var cpwInput = $("#cpw");
	var pwError = $("#pwError");
	var birthValid = false;
	var birthInput = $("#birth");
	var birthError = $("#birthError");
	var phoneValid = false;
	var phoneInput = $("#phone");
	var phoneError = $("#phoneError");
	$subBtn.prop("disabled", true);

	$("#email").on("blur", function() { // blur : focus를 잃을떄, 칸에서 벗어날때 실행
		var email = $(this).val(); // 입력된 email주소를 받아서 변수로 저장
		$.ajax({
			url: "/member/checkEmail", // url : http://localhost/member/checkEmail
			type: "POST", // Post방식으로
			data: { email: email }, // 변수로 저장한 email 값을
			dataType: "json", // json 타입으로
			success: function(response) { // 성공하면 response 실행
				if (response.status === "error") { // response의 값이 error 이면,

					emailValid = false; // 이메일 검증 실패
					emailInput.css("border-color", "red");
					emailError.css("display", "block");
				} else if (response.status === "success") { // response의 값이 success이면,
					console.log(response.message); // console에 표시(사용가능한 이메일)
					emailValid = true; // 이메일 검증 성공
					emailInput.css("border-color", "");
					emailError.css("display", "none");
				}
				updateSubmitButtonState(); // 버튼 상태 업데이트
			},
			error: function(xhr, status, error) { // 에러 발생시
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
					nickNameValid = false; // 닉네임 검증 실패
					nickNameInput.css("border-color", "red");
					nickNameError.css("display", "block");
				} else if (response.status === "success") {
					console.log(response.message);
					nickNameValid = true; // 닉네임 검증 성공
					nickNameInput.css("border-color", "");
					nickNameError.css("display", "none");
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

	$("#cpw").on("blur", function() {
		var pw = $("#pw").val();
		var cpw = $(this).val();
		console.log(pw);
		console.log(cpw);
		$.ajax({
			url: "/member/checkPw",
			type: "POST",
			data: {
				pw: pw,
				cpw: cpw
			},
			dataType: "json",
			success: function(response) {
				if (response.status === "error") {
					pwValid = false;
					pwInput.css("border-color", "red");
					cpwInput.css("border-color", "red");
					pwError.css("display", "block");
					updateSubmitButtonState(); // 버튼 상태 업데이트
				} else if (response.status === "success") {
					console.log(response.message)
					pwValid = true;
					cpwInput.css("border-color", "");
					pwInput.css("border-color", "");
					pwError.css("display", "none");
					updateSubmitButtonState(); // 버튼 상태 업데이트
				}
			}
		});
	});
	$("#birth").on("blur", function() {
		var birthVal = $(this).val();

		if (/[^0-9]/.test(birthVal)) {
			birthValid = false;
			birthInput.css("border-color", "red");
			birthError.css("display", "block");
			updateSubmitButtonState(); // 버튼 상태 업데이트
		} else {
			birthValid = true;
			birthInput.css("border-color", "");
			birthError.css("display", "none");
			updateSubmitButtonState(); // 버튼 상태 업데이트
		}
	})
	
	$("#phone").on("blur", function() {
		var phoneVal = $(this).val();

		if (/[^0-9]/.test(phoneVal)) {
			phoneValid = false;
			phoneInput.css("border-color", "red");
			phoneError.css("display", "block");
			updateSubmitButtonState(); // 버튼 상태 업데이트
		} else {
			phoneValid = true;
			phoneInput.css("border-color", "");
			phoneError.css("display", "none");
			updateSubmitButtonState(); // 버튼 상태 업데이트
		}
	})
	function updateSubmitButtonState() { // 버튼 활성화하는 기능
	
		if (emailValid && nickNameValid && pwValid && birthValid) { // 검증 체크를 통과하면
			$subBtn.prop("disabled", false); // 버튼 활성화
		} else {// 아니면
			$subBtn.prop("disabled", true); // 하나라도 실패하면 버튼 비활성화
		}
	}


	$("#myForm").on("submit", function(e) {

		var pw = $("#pw");
		var cpw = $("#cpw");
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
		// nickName의 글자가 2자이하, 10자 이상이면
		if (nickName.length < 2 || nickName.length > 10) {
			e.preventDefault();
			alert("닉네임은 2자 이상 10자 이하 이어야 합니다.");
			return;
		}
		
		if (birth.length !== 6) {
			e.preventDefault();
			alert("생년월일은 정확히 6자이어야 합니다.");
			return;
		}
		// 각변수의 값은 현재 input값에 입력된 값으로 저장되어있음
		// 하나의 칸이라도 비어있으면 alert창 띄움
		if (!name || !phone || !email || !nickName || !pw || !cpw || !birth) {
			e.preventDefault();
			alert("입력하지 않은 정보가 있습니다.");
			return;
		}
	});
	
	$subBtn.on("click",function(e){
		e.preventDefault();
		alert("회원가입 기능을 차단해놨습니다. 테스트 계정을 이용해주세요");
	})
});
