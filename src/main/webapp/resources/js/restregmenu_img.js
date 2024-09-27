/**
 * restregmenu.js -> regmenu.jsp
 */

$(document).ready(function() {
	var resNum = $("#menu_resNum").val();
	var uploadbox = $("#menuImg");
	var menuImg = uploadbox[0].files;
	var previewBox = $(".inbox").find("#uploadImg");
	console.log("test:" + resNum);

	//파일업로드클릭->미리보기생성, 보이기
	menuImg.on("change", function() {
		const reader = new FileReader();
		reader.onload = function(e) {
			console.log("test:reader.onload실행" );
			var fileSize = menuImg.size;
			var fileName = menuImg.name;
			var result = setting.checkFile(fileName, fileSize);
			if (result == false) {
				return;
			}

			previewBox.find("img").attr("src", e.target.result);
			console.log("test:" + e.target.result);
		};
	})





	//등록버튼 클릭->json 생성->ajax
	$("#saveMenuBtn").on("click", function(e) {
		var formData = new FormData(); //파일+객체 합칠 formdata
		var form = $("#menuregForm");
		var menu = setting.makeForm(form); //menu 객체로 보낼거

		console.log("test:" + menuImg);
		console.log("test:" + menu);
		if (setting.checkFile(menuImg.name, menuImg.size)) {
			formData.append("menuImg", menuImg);
			formData.append("menu", menu);
		} else {
			return;
		}


		/*	regMenu(menu, function(result) {
				if (result == "success") {
					alert("메뉴등록 성공");
					self.location = '/restaurant/menulist'
				} else {
					alert("등록오류. 관리자에게 문의하세요.");
				}
			});*/
	});




}); //$(document).ready 

//사전작업
var setting = (function() {
	//formdata 만들기(이미지파일 아닌 부분)
	function makeForm(form) {
		var menu = new FormData();
		var resNum = $("input[name='resNum']").val();
		var menuName = $("input[name='menuName']").val();
		var mainIngredient = $("input[name='mainIngredient']").val();
		var menuAcoount = $("textarea[name='menuAcoount']").val();
		var unitCost = $("input[name='unitCost']").val();
		var serving = $("input[name='serving']").val();
		var menuImg = $("input[name='menuImg']");
		var file = menuImg[0].files;

		menu.append(resNum, resNum);
		menu.append(menuName, menuName);
		menu.append(mainIngredient, mainIngredient);
		menu.append(menuAcoount, menuAcoount);
		menu.append(unitCost, unitCost);
		menu.append(serving, serving);
		menu.append(menuImg, file.name);
	}

	//파일검증(확장자, 크기)
	function checkFile(fileName, fileSize) {
		var regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif)$"); //이미지파일만 받는다.
		var maxSize = 5242880; //5MB

		if (fileSize > maxSize) {
			alert("파일 사이즈가 너무 큽니다.(최대 5MB)");
			return false;
		}

		if (!regex.test(fileName)) {
			alert("이미지형식의 파일만 업로드 가능합니다.(jpg, png)");
			return false;
		}
	}



	return {
		makeForm: makeForm,
		checkFile: checkFile
	}

})();

/*//메뉴등록 ajax 사용안함->이미지 form 전송으로 변경
function regMenu(menu, callback, error) {
	console.log("test:메뉴등록 ajax 함수실행....");
	$.ajax({
		url: '/restaurant/newmenu',
		type: 'post',
		data: JSON.stringify(menu),
		contentType:"application/json; charset=utf-8",
		success:function(result){
			if(callback){
				callback(result);
			}
		},
		error:function(xhr, status, er){
			if(error){
				error(er)
			}
		}
	});//--ajax
} //--regMenu()*/

//등록메뉴 불러오기(리스트보이기)
