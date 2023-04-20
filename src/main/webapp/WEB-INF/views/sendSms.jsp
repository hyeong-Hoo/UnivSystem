<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="ko">
<head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Send Mail</title>
</head>
<body>
<div>
    <h1>텍스트 메일 보내기</h1>
 
    <form action="/sms/send" method="post">

        <table>
            <tr class="form-group">
                <td>발송할 전화번호</td>
                <td>
                    <input type="text" class="form-control" name="to" placeholder="이메일 주소를 입력하세요">
                </td>
            </tr>
            <tr class="form-group">        
                <td>내용</td>
                <td>
                    <textarea class="form-control" name="content" placeholder="보낼 내용을 입력하세요"> </textarea>
                </td>
            </tr>
        </table>
        <button type="submit">발송</button>
    </form>
 
 </div>
 </body>
 </html>
