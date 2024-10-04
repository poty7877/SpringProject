var menuviewService = (function() {
    function makepreview() {
        // 모든 메뉴 항목을 반복합니다.
        $("input[name='resNum']").each(function(index) {
            var resNum = $(this).val();
            var folder = $(".filedata").eq(index).data("path"); // 각 메뉴의 folderName
            var fname = $(".filedata").eq(index).data("fname"); // 각 메뉴의 saveName
            var path = resNum + "/" + folder + "/" + fname;
            var fileName = path.split('/').map(encodeURIComponent).join('/');

            var str = "<img alt='메뉴 이미지' src='/restaurant/displaythumb?fileName=" + fileName + "' height='237px'>";
            var imgbox = $(".hasimg").eq(index); // 각 메뉴 항목의 .hasimg 요소 선택
            imgbox.append(str); // 이미지 추가
            console.log("Image added for menu " + index + ": " + str);
        });
    }

    return {
        makepreview: makepreview
    };
})();

$(document).ready(function() {
    menuviewService.makepreview();
});
