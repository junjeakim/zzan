<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ZZan - 쇼핑백</title>
<link rel="stylesheet" href="/style/Basket.css">
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/ind/header.jsp"%>
        <div id="sub_contents" class="inner_none">
            <div class="inner">
                <div class="conbody">
                    <div class="sub_view_wrap">
                        <div class="inner">
                            <form name="frmcartlist" method="post">
                                <div class="con01">
                                    <table>
                                        <colgroup>
                                            <col width="700px">
                                            <col width="138px">
                                            <col width="108px">
                                            <col width="108px">
                                            <col width="88px">
                                            <col width="58px">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th>상품명</th>
                                                <th>총수량</th>
                                                <th>판매가</th>
                                                <th>소계</th>
                                                <th>적립금</th>
                                                <th>삭제</th>
                                            </tr>
                                            <tr>
                                                <td colspan="6" style="text-align: center; line-height: 200px">
                                                    장바구니가 비어있습니다.
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tbody>
                                        <tr>
                                            <td align="center"><a href="index.jsp">
                                                    <div
                                                        style="width: 160px; height: 50px; background: #fff; color: #004986; font-size: 16px; font-weight: 700; border: 1px solid #004986; text-align: center; line-height: 48px; display: inline-block;">
                                                        계속쇼핑하기
                                                    </div>
                                            </a></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/WEB-INF/views/ind/footer.jsp"/>
    </div>
    <!-- div#wrap -->
    <script src="/script/jquery-3.7.1.min.js"></script>
    <script src="/script/script.js"></script>
</body>
</html>
