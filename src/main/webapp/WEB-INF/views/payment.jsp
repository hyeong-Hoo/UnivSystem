<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Application Payment</title>
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    
    <script>
    function createOrderNum(){
    	const date = new Date();
    	const year = date.getFullYear();
    	const month = String(date.getMonth() + 1).padStart(2, "0");
    	const day = String(date.getDate()).padStart(2, "0");
    	
    	let orderNum = year + month + day;
    	for(let i=0;i<10;i++) {
    		orderNum += Math.floor(Math.random() * 8);	
    	}
    	return orderNum;
    }
        var IMP = window.IMP; 
        IMP.init("imp75220550"); 
               
    
        function requestPay() {
        	const orderNum = createOrderNum();
        	IMP.request_pay({
        	pg: 'html5_inicis',
        	pay_method: 'card',
        	merchant_uid: orderNum,
        	name: '대한항공 후쿠오카 퍼스트클래스 1인석',
        	amount: 100,
        	buyer_email: 'Iamport@chai.finance',
        	buyer_name: '포트원 기술지원팀',
        	buyer_tel: '010-1234-5678',
        	buyer_addr: '서울특별시 강남구 삼성동',
        	buyer_postcode: '123-456'
        	}, function(rsp) {
        	console.log(rsp);
        	if (rsp.success) {
        	var msg = '결제가 완료되었습니다.';
        	alert(msg);
        	location.href = "http://localhost/assessment";
        	searchPayment();
        	} else {
        	var msg = '결제에 실패하였습니다.';
        	msg += '에러내용 : ' + rsp.error_msg;
        	alert(msg);
        	}
        	});
        	}
        
       
    </script>	
<script>
function searchPayment() {
	  var name = $("#name").val();
	  var birthdate = $("#birthdate").val();
	  
	  $.ajax({
	    url: "/pms",
	    data: { KORN_FLNM: name, USER_BRDT: birthdate },
	    success: function(data) {
	        console.log("Payment updated successfully.");
	      }
	  });
	}

</script>
</head>
<body>
Name: <input id="name">
Birthdate: <input id="birthdate">
<button onclick="searchPayment()">Query</button>
    <button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->


<div id="result"></div>
</body>
</html>