<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입 약관 동의</title>
    <link rel="stylesheet" href="/style/style.css?v">
    <link rel="stylesheet" href="/style/join_Agreement.css?v">
</head>
<body>
    <div id="wrap">
        <!-- 헤더 템플릿 포함 -->
        <%@ include file="/WEB-INF/views/ind/header.jsp" %> <!-- 헤더 include 경로 수정 -->
        <main id="main" class="dFlex">
        <div id="agreement_check" class="agree">
            <div id="chk">
                <h2>회원가입</h2>
                <iframe src="/member/join/memberJoin_Agreement.jsp" width="600" height="400" class="no-scroll"></iframe>
                <div class="agreeArea"> 
                     <label>
                         <input type="checkbox" id="agreechk">
                         회원가입약관을 읽었으며 내용에 동의합니다.
                     </label>
                </div>
                <iframe src="/member/join/Information_Agreement.jsp" width="600" height="400" class="no-scroll"></iframe>
                <div class="agreeArea"> 
                    <label>
                         <input type="checkbox" id="pi_agreechk">
                         개인정보취급방침을 읽었으며 내용에 동의합니다.
                    </label>
                </div>
                <button onclick="chkAgree()">확인</button>
            </div>
        </div>
        </main>
    </div>
    <script src="/script/jquery-3.7.1.min.js"></script>
    <script src="/script/script.js"></script>
    <script>
        function chkAgree() {
            var agreechk = document.getElementById("agreechk");
            var piAgreechk = document.getElementById("pi_agreechk");
            
            if(agreechk.checked && piAgreechk.checked) {
                self.location.href = "/member/join/member_join.jsp";
            } else {
                alert("회원가입 약관과 개인정보취급방침을 모두 동의체크 하시기 바랍니다.");
            }
            return false;
        }
    </script>
</body>
</html>
