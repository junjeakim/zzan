<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String uId_Session = (String) session.getAttribute("userId");
%>
<link rel="stylesheet" href="/style/header_style.css?v">
<header id="header">
    <div id="h_top" class="dFlex">
        <div id="searchArea">
            <input type="text" id="searchKey" name="search">
            <button>검색</button>
        </div>
        <a href="/"><img alt="Logo"
            src="/images/Logo-removebg.png"></a>
        <div id="H_btnArea">
            <%if(uId_Session != null){ %>
            <button id="cart">장바구니</button>
            <button id="myPageBtn">마이페이지</button>
            <button id="logoutBtn">로그아웃</button>
            <%}else{ %>
            <button id="memRegBtn">회원가입</button>
            <button id="loginBtn">로그인</button>
            <%}%>
        </div>
    </div>
    <div id="h_bottom" class="dFlex">
        <div id="mainMenus">
            <ul id="mainMenu" class="dFlex">
                 <!-- 기존의 '위스키' 메뉴 항목 -->
                <li class="whisky">위스키
                    <ul class="subMenus">
                        <li class="whisky">임페리얼</li>
                        <li class="whisky">패스포트</li>
                    </ul>
                </li>
                <!-- 새로 추가한 '와인' 메뉴 항목 -->
                <li class="wine">와인
                    <ul class="subMenus">
                        <li class="wine">무똥까네</li>
                    </ul>
                </li>
                <!-- 새로 추가한 '보드카' 메뉴 항목 -->
                <li class="bodca">보드카
                    <ul class="subMenus">
                        <li class="bodca">앱솔루트</li>
                    </ul>
                </li>
                <!-- 새로 추가한 '전통주' 메뉴 항목 -->
                <li class="traditional">전통주
                    <ul class="subMenus">
                        <li class="traditional">고운달</li>
                        <li class="traditional">문배</li>
                    </ul>
                </li>
                <li id="board" class="bbs">게시판
                    <ul class="subMenus">
                        <li class="notice">공지사항</li>
                        <li class="bbs">문의사항</li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</header>
