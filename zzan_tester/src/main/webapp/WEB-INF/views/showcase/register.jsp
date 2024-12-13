<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
<link rel="stylesheet" href="/style/style_showcase.css?v=<%= System.currentTimeMillis() %>">
<link rel="stylesheet" href="/style/style.css?v">
</head>
<body>
    <div id="wrap" class="productWrap">
        <jsp:include page="/WEB-INF/views/ind/header.jsp" /> <!-- 헤더 경로 수정 -->
        <h1>상품 등록</h1>
        <div id="formArea">
            <form id="productReg" action="/uploadFile" method="post" enctype="multipart/form-data"> <!-- 여기서 action 경로 수정 -->
                <label>
                    <span>상품이미지</span>
                    <input type="file" name="image" required>
                </label>
                <br>
                <label>
                    <span>상품명</span>
                    <input type="text" name="productName" required>
                </label>
                <br>
                <label>
                    <span>가격</span>
                    <input type="text" name="price" required>
                </label>
                <br>
                <label>
                    <span>상품설명</span>
                    <textarea name="description" required></textarea>
                </label>
                <br>
                <label>
                    <span>상품종류</span>
                    <select name="category" required>
                        <option value="whisky" selected>위스키</option>
                        <option value="wine">와인</option>
                        <option value="bodca">보드카</option>
                        <option value="traditional">전통주</option>
                    </select>
                </label>
                <div class="btnArea">
                    <button type="submit" form="productReg" class="bobo">등록</button>
                    <button type="reset" class="bobo">초기화</button>
                </div>
            </form>
        </div>

        <div class="btnArea">
            <button type="button" class="bobo" onclick="location.href='/showcase/productList?productType=whisky'">위스키 목록</button>
            <button type="button" class="bobo" onclick="location.href='/showcase/productList?productType=wine'">와인 목록</button>
            <button type="button" class="bobo" onclick="location.href='/showcase/productList?productType=bodca'">보드카 목록</button>
            <button type="button" class="bobo" onclick="location.href='/showcase/productList?productType=traditional'">전통주 목록</button>
        </div>
        <br>
        <jsp:include page="/WEB-INF/views/ind/footer.jsp" /> <!-- 푸터 경로 수정 -->
    </div>
    <script src="/script/jquery-3.7.1.min.js"></script>
    <script src="/script/script.js"></script>
</body>
</html>
