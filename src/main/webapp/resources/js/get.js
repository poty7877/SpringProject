

var menuviewService = (function() {
	function makepreview() {
		var resNum = $("input[name='resNum']").val();
		var folder = $(".filedata").data("path");
		var fname = $(".filedata").data("fname");
		var fileName = encodeURIComponent(resNum + "/" + folder + "/" + fname); //s_없는 원본이미지 경로
		fileName = fileName.replace(/\\/g, "/");

		var str = "<img alt='메뉴 이미지' src='/restaurant/displaythumb?fileName=" + fileName + "' height=237px>";
		var imgbox = $(".hasimg");
		imgbox.append(str);
		console.log(str);
		//target.attr("src", "/restaurant/displaythumb?fileName="+fileName+"");
		console.log("test folder: " + folder);
		console.log("test fname: " + fname);
		console.log("test src: " + fileName);

	}

	return {
		makepreview: makepreview
	}


})();


$(document).ready(function() {


	var nullBox = $("#nullBox");

	menuviewService.makepreview();

	nullBox.css("display", "none");


});
