<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안녕</title>
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
<!-- 아임포트 -->
<script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>

</head>

<script type="text/javascript">
function iamport(){
    //가맹점 식별코드
    const IMP = window.IMP;

    IMP.init('imp75220550');

    $("#test1").click(function(){
        IMP.request_pay({
            pg: "html5_inicis",
            pay_method: "card",
            merchant_uid: "123",
            name: "아이리버 무선 마우스 외 1개",
            amount: 10000,
            buyer_email: "이메일@gmail.com",
            buyer_name: "홍길동",
            buyer_tel: "010-4242-4242",
            buyer_addr: "서울특별시 강남구 신사동",
            buyer_postcode: "01181",
            m_redirect_url : "/"
        }, function (rsp) { // callback
            if (rsp.success) {
                alert('결제가 성공했습니다.');

                // 결제 성공 로직
            } else {
                alert('결제에 실패했습니다.');

                // 결제 실패 로직
            }
        });
    });
}

	


</script>
<body>
<input type="button" id="test1" value="결제 가즈아">

<script type="text/javascript">
$(document).ready(function() {
    iamport();
});
</script>
</body>
</html>