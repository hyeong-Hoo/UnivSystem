<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    div{font-family: 'IBM Plex Sans KR', sans-serif;}
    body{margin: 0;padding: 0}
    .main-body{
    width:1920px;
    height:2100px;
    background-color: #e6e6e6;
    }
    .container{
    margin: 0 auto;
    width:1440px;
    height:2000px;
    background-color: #e6e6e6;
    }
    .container2{
        position: relative;
        top:30px;
        width:1440px;
        height: 1900px;
        background: white;
    }
    .top-line{
        width:1340px;
    position: relative;
    top:70px;
        left:50px;
    border-top : 3px solid #8787bf;
    }
    .top-text{
        position: relative;
        top: 100px;
        left:50px;
        width:1340px;
        height:20px;
        text-align: end;
        color:red;
    }
    .table1{
        position: relative;
        top:100px;
        left:50px;
        width:1340px;
        height:500px;

    }
    .tr1>th{
        border: 1px solid #c1c1c1;
    }
      .table2{
        position: relative;
        top:100px;
        left:50px;
        width:1340px;
        height:150px;

    }
    .person{
        position: relative;
        top:132px;
        left:50px;
        width:1340px;
        height:100px;
        font-size: 40px;
    }
      .table3{
        position: relative;
        top:100px;
        left:50px;
        width:1340px;
        height:500px;

    }
    .thee{
         width:180px;
        background-color: gainsboro;
    }
     .thee1{
        text-align: left;
        background-color: darkgray;
    }
    .t1{
    text-align: left;

    }
    .add-btn{
        position: relative;
        top:200px;
        left:450px;
        border-style: none;
        border-radius: 5px;
        background-color: gray;
        width:500px;
        height:60px;
        font-size: 30px;
        color:aliceblue;
    }
    .add-btn:hover{
        color:darkgray;
        cursor:pointer;
    }
    .photo{
    height:200px;
    }
    .photo>th{
    border: 1px solid #c1c1c1;
    background: gainsboro;
    }
    .photo>td{
    border: 1px solid #c1c1c1;
    text-align:center;
    }
    .photo>td>img{
    width:600px;
    height:150px;
    }
    .imge_size>img{
        width:180px;
        height:215px;
    }


</style>
<body>
 <div class="person">개인정보</div>
            <div class="top-text">*필수입력항목</div>
            <table class="table2">
                            <tr class="photo">
                                <th id="p_btn"><div class="imge_size" id="image_container" ></div></th>
                                <td><div class="file_div">사진파일크기는<br><h1>3x4</h1><br>사이즈를 사용해주세요<br></div><input type="file" id="image"name="image" accept="image/*" onchange="setThumbnail(event);"/></td>
                                <td class="t1" colspan="2">&emsp;<img src="./images/img3.png" alt="증명사진"></td>
                            </tr>
                            <tr class="tr1">
                            <th class="thee">성명</th>
                            <th class="t1" >&emsp;<input type="text" id="korn_flnm" name="korn_flnm"></th>
                            <th class="thee">연락처</th>
                            <th class="t1" colspan="3">&emsp;<input type="text" id="telno" name="telno"></th>
                            </tr>
                            <tr class="tr1">
                                 <th class="thee">이메일</th>
                                <th class="t1">&emsp;<input type="text" id="rel_n" name="rel_n"></th>
                                <th class="thee">비상연락처</th>
                                <th class="t1">&emsp;<input type="text" id="rel_telno" name="rel_telno"></th>
                            </tr>
                            <tr class="tr1">
                            </tr>
                            <tr class="tr1">
                                <th class="thee">우편번호</th>
                                <th class="t1" colspan="3">&emsp;<input type="text" id="zip" name="zip" readonly="readonly">&emsp;<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"></th>
                            </tr>
                            <tr class="tr1">
                               <th class="thee">주소</th>
                               <th class="t1">&emsp;<input type="text"  id="addr" name="addr" readonly="readonly" style="width:auto;"></th>
                               <th class="thee">상세주소</th>
                               <th class="t1">&emsp;<input type="text" id="daddr" name="daddr" placeholder="직접입력" style="width:auto;"></th>
                            </tr>
                            <tr class="tr1">
                               <th class="thee">생년월일</th>
                               <th class="t1">&emsp;<input type="text" id="user_brdt" name="user_brdt" placeholder="ex)19901122" maxlength="8"></th>
                               <th class="thee">성별</th>
                               <th class="t1">&emsp;<input type="radio" name="gender_cd" value="남성">&emsp;남성&emsp;<input type="radio" name="gender_cd" value="여성">&emsp;여성</th>
                            </tr>
								
                        </table>
            <button type="button" id="add-btn" class="add-btn" name="done">수정완료</button>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip').value = data.zonecode;
                document.getElementById("addr").value = roadAddr;


                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
                }
            }
        }).open();
    }
    function setThumbnail(event) {
    	  var reader = new FileReader();
    	  var imgContainer = document.querySelector("div#image_container");
    	  var fileInput = document.querySelector("input#image");

    	  // 파일이 선택되지 않은 경우
    	  if (!event.target.files || !event.target.files[0]) {
    	    // 이전에 업로드된 이미지가 있을 경우, 메시지 출력 없이 그대로 둠
    	    if (imgContainer.hasChildNodes()) {
    	      return;
    	    }
    	    // 이전에 업로드된 이미지가 없을 경우, 메시지 출력
    	    else {
    	      alert("파일이 선택되지 않았습니다.");
    	      fileInput.value = "";
    	      return;
    	    }
    	  }

    	  // 이미 업로드된 이미지가 있으면 삭제
    	  if (imgContainer.hasChildNodes()) {
    	    imgContainer.removeChild(imgContainer.firstChild);
    	  }

    	  reader.onload = function(event) {
    	    var img = document.createElement("img");
    	    img.setAttribute("src", event.target.result);
    	    imgContainer.appendChild(img);
    	  };

    	  reader.readAsDataURL(event.target.files[0]);
    	}

</script>
</html>