$(function() {
    setInterval(fnSlide, 2000);

    function fnSlide() {
        $("div#slideshow>img").eq(0).fadeOut(
            1000, 
            function() {
                $("div#slideshow>img:first-child").insertAfter("div#slideshow>img:last-child");
                $("div#slideshow>img").eq(1).fadeIn(1200);
            }
        );
    }

    $("ul#mainMenu>li").hover(
        function() {
            $(this).children(".subMenus").stop().slideDown("fast");
        },
        function() {
            $(this).children(".subMenus").stop().slideUp("fast");
        }
    );

    $("li").click(function(){
        if ($(this).closest("ul").hasClass("subMenus")) {
            let attrId = $(this).attr("class");

            if(attrId == "bbs"){
                location.href = "/bbs/bbs";
            }else if(attrId == "notice"){
                location.href = "/bbs/bbs?pageType=notice";
            }else{
                location.href = "/showcase/productList?productType=" + attrId;    
            }
        }
    });

    $("#cart").click(function(){
        location.href = "/cart/shoppingBasket";
    });
    $("#loginBtn").click(function(){
        location.href = "/member/Login";
    });
    $("#memRegBtn").click(function(){
        location.href = "/member/join/member_join";
    });

    $("#regBtn").click(function(){
        let subject = $("#subject").val().trim();        
        
        if (subject == "") {
            alert("제목은 필수입력입니다.");
            $("#subject").focus();
        } else {
            $("#writeFrm").attr("action", "/bbs/writeProc");
            $("#writeFrm").submit();
        }
    });

    $("#logoutBtn").click(function(){
        location.href = "/member/LogoutProc";
    });
});

function goAdmin() {
    location.href = "/admin/adminLogin";
}

function read(idx){
    location.href = "/bbs/read?idx=" + idx;
}

// 추가 삭제식
function deleteProduct(productId) {
    if (confirm("정말 삭제하시겠습니까?")) {
        location.href = "/showcase/deleteFile?idx=" + productId;
    }
}



