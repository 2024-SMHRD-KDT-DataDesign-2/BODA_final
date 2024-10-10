<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/join.css">
</head>
<body>
 
 <img src="assets/image/BODA로고2.png" alt="로고" id="BODA">
    <form action="팀원승인Service" method="post"></form>
        <div id="login">
        <table>
        <tr>
            <th><div id="boda"><h1>BODA</h1></div></th>
        </tr>        
        <form action="팀원신청Service" method="post">                  
       
               <tr><td class="btn">프로젝트 이름</td></tr>
              <tr><td><input type="text" name="proj_name" class="text" placeholder="신청할 프로젝트 이름" ></td></tr> 
       
              <tr><td class="btn">회원 역할</td></tr>
              <tr><td><input type="text" name="mem_role" class="text" placeholder="역할 입력" ></td></tr>  
                                
        
        <tr><td><input type="submit" value="제출" style="float: right;"></td></tr>

        </form>
        </table>
    </div>
    
    </form>

</body>
</html>