console.log(loggedIn);
if (!loggedIn) {
	$("#myModal").modal("show");
	$("#myModal").on("hidden.bs.modal", function() {
		window.location.href = "/";
	});
} else {


	$(document).ready(function() {
		$("button").on("click", function(e) {
			e.preventDefault(); // 기본 버튼 동작 방지
			var form = $(this).closest("form");
			var btnId = $(this).attr("id");
			// form 요소 찾기

			if (btnId === "remove") {

				window.location.href = "/member/remove";

			} else if (btnId === "home") {

				window.location.href = "/";
			} else {
				var name = $("#name").val();
				var phone = $("#phone").val();
				var email = $("#email").val();
				var nickName = $("#nickName").val();
				var pw = $("#pw").val();
				var cpw = $("#cpw").val();
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
				if (pw.length < 6
					|| pw.length > 20) {
					alert("비밀번호는 6자이상 또는 20자 이하 이어야 합니다.");
					return;
				}
				if (birth.length !== 6) {
					alert("생년월일은 정확히 6자이어야 합니다.");
					return;
				}
				if (!name || !phone || !email
					|| !nickName || !pw
					|| !cpw || !birth) {
					alert("입력하지 않은 정보가 있습니다.");
					return;
				}
				if (pw === cpw) {
					form.submit();
				} else {
					alert("비밀번호가 다릅니다.");
					return;
				}
				form.submit();
			}
		});





	});
}