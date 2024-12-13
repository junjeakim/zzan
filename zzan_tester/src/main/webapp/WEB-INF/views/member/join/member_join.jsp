<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/style/style.css?v">
<link rel="stylesheet" href="/style/join.css?v">
<script src="/script/jquery-3.7.1.min.js"></script>
<script src="/script/script.js"></script>
</head>
<body>
    <div id="wrap">
        <!-- 헤더 템플릿 포함 -->
        <%@ include file="/WEB-INF/views/ind/header.jsp" %> <!-- 헤더 include 경로 수정 -->
        <div class="join_area">
            <form name="form" action="/member/join/joinProc.jsp" method="post" onsubmit="return validateForm()">
                <h1>회원가입</h1>
                <h2><span style="color:#ff0000;">*</span>회원정보</h2>
                
                <table class="sample-table">
                    <tbody>
                        <tr>
                            <td class="title">이름</td>
                            <td>
                            <input type="text" name="mName" required></td>
                        </tr>
                        <tr>
                            <td class="title">아이디</td>
                            <td>
                            <div class="input-container">
                                <input class="textArea" type="text" name="mId" maxlength="20"
                                placeholder="대,소문자와 숫자만">
                               <button class="textbtn" type="button" onclick="idDuplChk()">중복확인</button>
                               </div>
                            </td>
                                       
                        </tr>
                        <tr>
                            <td class="title">비밀번호</td>
                            <td>
                                <input type="password" name="mPw">
                            </td>
                        </tr>
                        <tr>
                            <td class="title">비밀번호 확인</td>
                            <td>
                                <input type="password" name="mPw2" placeholder="비밀번호를 한번 더 입력하세요.">
                            </td>
                        </tr>
                        <tr>
                            <td class="title">이메일</td>
                            <td>
                            <div class="email-container">
                                <input type="text" name="mEmail" >
                                <i>@</i>  
                                <select name="mEmail2">
                                    <option value="">선택</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="hanmail.net">hanmail.net</option>
                                </select>
                            </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="title">생년월일</td>
                            <td><input type="date" name="mBirthday" ></td>
                        </tr>
                        <tr>
                            <td class="title">휴대전화</td>
                            <td>
                                <input type="text" name="mPhone"
                                       placeholder="010-1234-5678">
                            </td>
                        </tr>
                        <tr>
                            <td class="title">주소</td>
                            <td>
                                <input type="text" name="mAddr" maxlength="100" size="50">
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div id="btn">
                    <button class="btnArea" type="submit">확인</button>
                    <button class="btnArea" type="reset">취소</button>
                </div>
            </form>
        </div>
        <jsp:include page="/WEB-INF/views/ind/footer.jsp"/> <!-- 푸터 include 경로 수정 -->
    </div>
    
        <script>
    // 여기에 validateForm 함수를 추가 유효성검사는 삭제해도 넣어도 상관없음 겹치지만 않는다면야
        
function validateForm() {
    // 비밀번호와 비밀번호 확인 값 가져오기
    var password = document.forms["form"]["mPw"].value;
    var confirmPassword = document.forms["form"]["mPw2"].value;
    
    // 비밀번호가 일치하지 않으면 경고 메시지를 표시하고 false 반환
    if (password !== confirmPassword) {
        alert("비밀번호가 일치하지 않습니다.");
        return false;
    }
    return true; 
    // 비밀번호가 일치하면 true 반환
}
</script>

</body>
</html>
