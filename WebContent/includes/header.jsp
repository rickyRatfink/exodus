<%@page import="com.yada180.sms.domain.SystemUser"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>  
<% 
   SystemUser user = (SystemUser)session.getAttribute("system_user");
   if (user==null)
	   user=new SystemUser(); 
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/menu.css" media="screen">
<link href="<%=request.getContextPath()%>/css/tcal.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/scripts/tcal.js"></script>
  
<title>Exodus Recovery Management System</title>


<script type="text/javascript">

function toggleVisibility(sId) {
	
if (sId=='Applications') {
	document.getElementById('Applications').style.visibility = "visible";
	document.getElementById('Residents').style.visibility = "hidden";
	document.getElementById('Accounting').style.visibility = "hidden";
	document.getElementById('Reports').style.visibility = "hidden";
}
if (sId=='Residents') { 
	document.getElementById('Applications').style.visibility = "hidden";
	document.getElementById('Residents').style.visibility = "visible";
	document.getElementById('Accounting').style.visibility = "hidden";
	document.getElementById('Reports').style.visibility = "hidden";
}
if (sId=='Accounting') { 
	document.getElementById('Applications').style.visibility = "hidden";
	document.getElementById('Residents').style.visibility = "hidden";
	document.getElementById('Accounting').style.visibility = "visible";
	document.getElementById('Reports').style.visibility = "hidden";
}
if (sId=='Reports') {
	document.getElementById('Applications').style.visibility = "hidden";
	document.getElementById('Residents').style.visibility = "hidden";
	document.getElementById('Accounting').style.visibility = "hidden";
	document.getElementById('Reports').style.visibility = "visible";
}




/*
if(document.getElementById(sId).style.visibility == "hidden" ) {
    document.getElementById(sId).style.visibility = "visible";
}
else {
  document.getElementById(sId).style.visibility = "hidden";
}
*/
}
</script>

</head>

<body>

<div id="footer">

	<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
	<td width="100%" background="<%=request.getContextPath() %>/images/footer_bg.png">
		<div id="item">Organization:&nbsp;&nbsp;&nbsp;</div><div id="itemValue">Palm Beach Recovery Center</div>
		<div id="item">User Name:&nbsp;&nbsp;&nbsp;</div><div id="itemValue">
			<%=user.getUsername() %>
		</div>
		<div id="item">System Date:&nbsp;&nbsp;&nbsp;</div><div id="itemValue"><%= new java.util.Date() %></div>
		
	</td>
	<td align="right" background="<%=request.getContextPath() %>/images/footer_bg.png"><a href="<%=request.getContextPath() %>/Login.do?action=logout" style="font: .70em bold 'Arial';'">[logout]</a>&nbsp;</td>
	<td alight="right"  background="<%=request.getContextPath() %>/images/footer_bg.png"><img src="<%=request.getContextPath() %>/images/flags.png"/></td>
	</tr>
	</table>
	
</div>

<!-- 
<div id="preheader" align="right" style="padding-top:5px;">
	<img src="<%=request.getContextPath() %>/images/flags.png"/>
</div>
 -->

<div id="header">
	<div id="logo" align="right"></div>
</div>


<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="800">
<ul class="menu">
	<li><a href="<%=request.getContextPath()%>/Intake.do?action=Home" style="text-decoration:none;">Home</a></li>
	<li><a href="#" onclick="toggleVisibility('Applications');">Applications</a></li>
	<li><a href="#" onclick="toggleVisibility('Residents');">Residents</a></li>
	<li><a href="#" onclick="toggleVisibility('Reports');">Reports</a></li>
	<li><a href="#" onclick="toggleVisibility('Accounting');">Accounting</a></li>
</ul> 
</td>
<td bgcolor="#ffffff" width="100%" style="border-left: 1px solid #6f9dd9;"></td>
</tr>
</table>





<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td width="100%" bgcolor="6f9dd9" height="1"></td>
</tr>

</table>

