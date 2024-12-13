<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String uId_Session = (String) session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리 같이 ZZan할까~?</title>
<link rel="stylesheet" href="/style/style.css">
</head>
<body>

    <div id="wrap">
        <jsp:include page="/WEB-INF/views/ind/header.jsp" />
        <main id="main">
            <div id="mainImgSlideArea">
                <div id="slideshow">
                    <img src="/images/slide/slide01.jpg" alt="slideImg">
                    <img src="/images/slide/slide02.jpg" alt="slideImg">
                </div>
            </div>
            <h2>Best List</h2>
            <div id="itemListArea" class="dFlex">
                <div id="item">
                    <div class="itemImgArea">
                        <img src="/images/whisky/Imperial17.jpg" alt="itemImg">
                    </div>
                    <div class="itemTxtarea">
                        <span>임페리얼 17년</span> <span>120000원</span>
                    </div>
                </div>
                <div id="item">
                    <div class="itemImgArea">
                        <img src="/images/whisky/Imperial17.jpg" alt="itemImg">
                    </div>
                    <div class="itemTxtarea">
                        <span>임페리얼 17년</span> <span>120000원</span>
                    </div>
                </div>
                <div id="item">
                    <div class="itemImgArea">
                        <img src="/images/whisky/Imperial19.png" alt="itemImg">
                    </div>
                    <div class="itemTxtarea">
                        <span>임페리얼 19년</span> <span>180000원</span>
                    </div>
                </div>
                <div id="item">
                    <div class="itemImgArea">
                        <img src="/images/whisky/Imperial21.jpg" alt="itemImg">
                    </div>
                    <div class="itemTxtarea">
                        <span>임페리얼 21년</span> <span>240000원</span>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="/WEB-INF/views/ind/footer.jsp"/>
    </div>
    <script src="/script/jquery-3.7.1.min.js"></script>
    <script src="/script/script.js"></script>
</body>
</html>
