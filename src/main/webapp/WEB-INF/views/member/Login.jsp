<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="/style/loginStyle.css">
</head>
<body>
    <div id="wrap">
        <!-- 헤더 템플릿 포함 -->
        <%@ include file="/WEB-INF/views/ind/header.jsp" %> <!-- 헤더 include 경로 수정 -->
        
        <main id="main" class="dFlex">
            <div id="Login_wrap">
                <div class="logintop">
                    <h2>LOGIN</h2>
                    <p>불편하신 사항이 있으시면 고객센터로 문의하여 주시기 바랍니다.</p>
                </div>
                
                <!-- 로그인 폼 시작 -->
                <form name="loginForm" action="loginprocess.jsp" method="post" autocomplete="off">
                    <div class="login_mid clfix">
                        <div class="login_con">
                            <!-- 아이디 입력 -->
                            <div class="login_id">
                                <span><img src="/images/ID이미지.jpg" alt="id로고"></span>
                                <input type="text" name="userId" id="userId" placeholder="아이디" required>
                            </div>
                            
                            <!-- 비밀번호 입력 -->
                            <div class="login_pw">
                                <span><img src="/images/pwimg.jpg" alt="비밀번호 이미지"></span>
                                <input type="password" name="password" id="password" placeholder="비밀번호" required>
                            </div>
                            
                            <!-- 로그인 버튼 -->
                            <button type="submit">로그인</button>
                            
                            <!-- 회원가입 및 아이디/비밀번호 찾기 링크 -->
                            <div class="login_bottom clfix">
                                <p>
                                    <a href="#">회원가입</a> | <a href="#">아이디/비밀번호 찾기</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </form>
                <!-- 로그인 폼 끝 -->
            </div>
        </main>
    </div>
    
    <!-- jQuery 및 JavaScript 파일 포함 -->
    <script src="/script/jquery-3.7.1.min.js"></script>
    <script src="/script/script.js"></script>
</body>
</html>
