/**
 * 
 */

var stuNo
var password
const signinbtn = document.querySelector("#signin_btn");
const signin_form = document.querySelector("#signin_form");
console.log("hello");
signinbtn.addEventListener('click', function() {
	stuNo = $("#username").val();
	password = $("#password").val();

	var returnData = "";
	console.log(stuNo + " " +password);
	if (stuNo != "" && password != "") {
		signcheck().done(function(data) {
			var result = data.result;
			console.log("result : " + result);
			if (result == "success") {// 로그인성공
				signin_form.submit();
			} else if (result == "fail") {
				alert("아이디나 비밀번호를 확인해주세요!!!");
			}
		});
	}
});

function signcheck() {
	stuNo = $("#username").val();
	password = $("#password").val();
	var obj = new Object();
	obj.userId = stuNo;
	obj.password = password;
	var jsonData = JSON.stringify(obj);
	console.log("json : " + jsonData);
	return $.ajax({
		type : 'POST',
		data : jsonData,
		url : "rest/signin",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		error : function(error) {
			console.log(error);
		}
	});
}
