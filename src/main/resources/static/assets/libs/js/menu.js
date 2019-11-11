


    // <div id="submenu-class" class="collapse submenu" style="">
    //     <ul class="nav flex-column">
    //
    //
    //         <li class="nav-item"><a class="nav-link" href="#"
    //                                 data-toggle="collapse" aria-expanded="false"
    //                                 data-target="#submenu-class-detail" aria-controls="submenu-11">Level
    //             2</a>
    //             <div id="submenu-class-detail" class="collapse submenu" style="">
    //                 <ul class="nav flex-column">
    //                     <li class="nav-item"><a class="nav-link" href="#">Level
    //                         1</a></li>
    //                     <li class="nav-item"><a class="nav-link" href="#">Level
    //                         2</a></li>
    //                 </ul>
    //             </div>
    //         </li>
    //
    //
    //         <li class="nav-item"><a class="nav-link" href="#"
    //                                 data-toggle="collapse" aria-expanded="false"
    //                                 data-target="#submenu-class-detail" aria-controls="submenu-11">Level
    //             2</a>
    //             <div id="submenu-class-detail" class="collapse submenu" style="">
    //                 <ul class="nav flex-column">
    //                     <li class="nav-item"><a class="nav-link" href="#">Level
    //                         1</a></li>
    //                     <li class="nav-item"><a class="nav-link" href="#">Level
    //                         2</a></li>
    //                 </ul>
    //             </div>
    //         </li>
    //
    //
    //     </ul>
    // </div>

$(function () {
    return $.ajax({
        type: 'POST',
        url: "../rest/myclass",
        contentType: "application/json; charset=UTF-8",
        success: function (myclasslist) {
            $(function() {
                return $.ajax({
                    type: 'POST',
                    url: "../rest/classmenu",
                    contentType : "application/json; charset=UTF-8",
                    success:function (menulist) {
                        var tag1 =" <li class='nav-item'><a class='nav-link' href='#' data-toggle='collapse' aria-expanded='false'" +
                            "data-target='#detail_";
                        var classid;
                        var tag2 = "' aria-controls='submenu-11'>";
                        var classnm;
                        var tag3 = "</a>";
                        var tag4 = " <div id='detail_"
                        var tag5 = "' class='collapse submenu' style=''><ul class=\'nav flex-column\'>";
                        var tag6 = "<li class=\'nav-item\'><a class=\'nav-link\' href='/board/"
                        var boardno;
                        var tag6_2 = "'>";
                        var boardnm ;
                        var tag7 = "</a></li>";
                        var result ="";
                        for(var i=0; i<myclasslist.length; i++){
                            classid = myclasslist[i].fk_classId;
                            classnm = myclasslist[i].myclassNm;
                            result = result + tag1+classid+tag2+classnm+tag3+tag4+classid+tag5;
                            for(var j=0; j<menulist.length; j++) {
                                if (menulist[j].fk_classId == myclasslist[i].fk_classId) {

                                    if(menulist[j].category!=true) {
                                        boardno = menulist[j].boardNo;
                                        boardnm = menulist[j].boardNm;
                                        result = result + tag6 + boardno + tag6_2 + boardnm + tag7;
                                    }
                                }
                            }
                            result = result + "</ul></div></li>";
                        }
                        result =
                        $('#classmenu').append(result);
                    }
                })

            });
        },
        error: function (error) {
            console.log(error);
        }
    });
})
;