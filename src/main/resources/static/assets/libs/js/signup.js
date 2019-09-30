/**
 * 
 */

var stuNo;
var stuNoNow;
var nick;
var nickNow;
var password;
var confirm;
var name;
var grade;
var phone;
var email;

const signup_btn = document.querySelector("#signup_btn");
const stuNo_btn = document.querySelector("#stuNo_btn");
const nick_btn = document.querySelector("#nick_btn");

var stuNo_check;
var stuNo_now_check;
var nick_check;
var nick_now_check;
var password_check;
var name_check;
var grade_check;
var phone_check;
var email_check;
var signup_agree = document.getElementById('signup_agree');

function goPost() {

	stuNoNow = $("#stuNo").val();
	nickNow = $("#nick").val();
	password = $("#password").val();
	confirm = $("#confirm").val();
	name = $("#name").val();
	grade = $("#grade").val();
	phone = $("#phone").val();
	email = $("#email").val();
	stuNo_now_check = false;
	nick_now_check = false;
	password_check = false;
	name_check = false;
	grade_check = false;
	phone_check = false;
	email_check = false;
	var signup_agree_check = false;

	const signup_form = document.querySelector("#signup_form");
	if (stuNo_check && stuNoNow == stuNo) {
		stuNo_now_check = true;
	} else {
		alert("학번 중복 체크를 확인해주십시오.");
		return false;
	}
	if (nick_check && nickNow == nick) {
		nick_now_check = true;
	} else {
		alert("닉네임 중복 체크를 확인해주십시오.");
		return false;
	}
	if (password && (confirm == password)) {
		password_check = true;
	} else {
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
	if (name != "") {
		name_check = true;
	} else {
		alert("이름을 입력해 주십시오.");
		return false;
	}
	if (grade != "") {
		grade_check = true;
	} else {
		alert("학년을 입력해 주십시오.");
		return false;
	}
	if (phone != "") {
		phone_check = true;
	} else {
		alert("전화번호를 입력해 주십시오.");
		return false;
	}
	if (email != "") {
		email_check = true;
	} else {
		alert("email을 입력해 주십시오.");
		return false;
	}

	if (signup_agree.checked == true) {
		signup_agree_check = true;
	} else {
		alert("회원가입 동의를 체크해주십시오.");
		return false;
	}

	if (stuNo_now_check && nick_now_check && password_check && name_check
			&& grade_check && phone_check && email_check && signup_agree_check) {
		alert("회원가입 성공");
		signup_form.submit();
	} else {
		return false;
	}

}

stuNo_btn.addEventListener('click', function() {
	stuNo = $("#stuNo").val();
	console.log(stuNo);

	var returnData = "";
	if (stuNo != "") {
		stuNocheck().done(function(data) {
			var result = data.result;
			console.log("result : " + result);
			if (result == "success") {// 중복없음
				alert("사용가능한 학번입니다.");
				stuNo_check = true;
			} else if (result == "fail") {
				alert("이미 가입되어있는 학번입니다.");
			}
		});
	} else {
		alert("학번을 입력하여 주십시오.");
	}
});

nick_btn.addEventListener('click', function() {
	nick = $("#nick").val();

	var returnData = "";
	if (nick != "") {
		nickcheck().done(function(data) {
			var result = data.result;
			console.log("result : " + result);
			if (result == "success") {// 중복없음
				alert("사용가능한 닉네임입니다.");
				nick_check = true;
			} else if (result == "fail") {
				alert("중복된 닉네임입니다.");
			}
		});
	} else {
		alert("닉네임을 입력하여 주십시오.");
	}
});
function nickcheck() {
	nick = $("#nick").val();
	var obj = new Object();
	obj.nick = nick;
	var jsonData = JSON.stringify(obj);
	console.log("json : " + jsonData);
	return $.ajax({
		type : 'POST',
		data : jsonData,
		url : "rest/signup_nick",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		error : function(error) {
			console.log(error);
		}
	});
}

function stuNocheck() {
	stuNo = $("#stuNo").val();
	var obj = new Object();
	obj.userId = stuNo;
	var jsonData = JSON.stringify(obj);
	console.log("json : " + jsonData);
	return $.ajax({
		type : 'POST',
		data : jsonData,
		url : "rest/signup_userId",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		error : function(error) {
			console.log(error);
		}
	});
}
