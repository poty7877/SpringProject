/**
 * restaurantregister.js : /restaurant/register.jsp
 */
 
function valForm(form){
	if(!form.resID.value){
		alert("아이디를 입력하세요.");
		return false;
	}
	
	if(!form.resPW.value){
		alert("패스워드를 입력하세요.");
		return false;
	}
	
	if(!form.resName.value){
		alert("식당명을 입력하세요.");
		return false;
	}
	
	if(!form.resAddr.value){
		alert("식당주소를 입력하세요.");
		return false;
	}
	
	if(form.dupleCheck.value=="nonCK"){
		alert("아이디 중복확인을 해주세요.");
		return false;
	}
} //--valForm(form)

//아이디 중복확인 --**작업중
$("#dupleCheck").on("click", function(){
	var resID = $("input[name='resID']").val;

}); //--dupleCheck