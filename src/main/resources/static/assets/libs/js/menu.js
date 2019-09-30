/**
 * 
 */


$(function(){
	var obj = new Object();
	return $.ajax({
		type : 'POST',
		url : "../rest/grademenu",
		contentType : "application/json; charset=UTF-8",
		success:function(data){
			
			var tag1="<li class='nav-item'><a class='nav-link' href='";
			var tag2="'>";
			var tag3="</a></li>";
			for(var i=0; i<data.length; i++){
				var link="../board/"+data[i].boardNo;
				var name=data[i].boardNm;
				$("#gradelist").append(tag1+link+tag2+name+tag3);
			}

		},
		error : function(error) {
			console.log(error);
		}
	});
});

$(function(){
	var obj = new Object();
	return $.ajax({
		type : 'POST',
		url : "../rest/commonmenu",
		contentType : "application/json; charset=UTF-8",
		success:function(data){
				
			var tag1="<li class='nav-item'><a class='nav-link' href='";
			var tag2="'>";
			var tag3="</a></li>";
			for(var i=0; i<data.length; i++){
				var link="../board/"+data[i].boardNo;
				var name=data[i].boardNm;
				$("#commonlist").append(tag1+link+tag2+name+tag3);
			}

		},
		error : function(error) {
			console.log(error);
		}
	});
});

//$(function(){
//	var obj = new Object();
//	return $.ajax({
//		type : 'POST',
//		url : "../rest/othermenu",
//		contentType : "application/json; charset=UTF-8",
//		success:function(data){
//				
//			var tag1="<li class='nav-item'><a class='nav-link' href='";
//			var tag2="'>";
//			var tag3="</a></li>";
//			for(var i=0; i<data.length; i++){
//				var link="../board/"+data[i].boardNo;
//				var name=data[i].boardNm;
//				$("#otherlist").append(tag1+link+tag2+name+tag3);
//			}
//
//		},
//		error : function(error) {
//			console.log(error);
//		}
//	});
//});