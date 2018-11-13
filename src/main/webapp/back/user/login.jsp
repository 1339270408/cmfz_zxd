<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>持名法州前台管理中心</title>
			
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

	<link rel="icon" href="${pageContext.request.contextPath}/back/img/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/common.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/login.css" type="text/css"></link>
	<script type="text/javascript" src="${pageContext.request.contextPath}/back/script/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/back/script/common.js"></script>

</head>
<body>
	
		<div class="login">
			<form id="loginForm" action="${pageContext.request.contextPath}/user/findLogin" method="post" >
				
				<table>
					<tbody>
						<tr>
							<td width="190" rowspan="2" align="center" valign="bottom">
								<img src="${pageContext.request.contextPath}/back/img/header_logo.gif" />
							</td>
							<th>
								用户名:
							</th>
							<td>
								<input type="text"  name="username" class="text" value="" maxlength="20"/>
							</td>
					  </tr>
					  <tr>
							<th>
								密&nbsp;&nbsp;&nbsp;码:
							</th>
							<td>
								<input type="password" name="password" class="text" value="" maxlength="20" autocomplete="off"/>
							</td>
					  </tr>


					<tr>
						<td>
							<span>${requestScope.message}</span>
						</td>
						<th>
							&nbsp;
						</th>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<th>&nbsp;</th>
						<td>
							<input type="button" class="homeButton" value="" onclick="location.href='#'"><input type="submit" class="loginButton" value="登录">
						</td>
					</tr>

				</tbody></table>
				<div class="link">
					<a href="${pageContext.request.contextPath}/back/user/insertUser.jsp">用户注册</a> |
				</div>
			</form>
		</div>
</body>
</html>