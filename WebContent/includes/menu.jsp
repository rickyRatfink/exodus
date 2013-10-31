<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:form action="/Intake">
  
			<div id="Applications"  >
			<div id="boxMenu"> 
				<div id="boxMenuHeader">Applications</div>
						<div id="boxSubMenuItem">
								<img src="<%=request.getContextPath()%>/images/bullet.png"/>Search</br>
								<img src="<%=request.getContextPath()%>/images/bullet.png"/>Accept</br>
								<img src="<%=request.getContextPath()%>/images/bullet.png"/>Admit To Program</br>
								<img src="<%=request.getContextPath()%>/images/bullet.png"/>Reopen</br>
								<img src="<%=request.getContextPath()%>/images/bullet.png"/>Deny</br></br>
						</div>
			</div>
			</div>
			
			
			<div id="Residents" style="position:absolute;top:105px;" >
			<div id="boxMenu">
				<div id="boxMenuHeader">Residents</div>
				<div id="boxSubMenuItem">
						<img src="<%=request.getContextPath()%>/images/bullet.png"/><a href="<%=request.getContextPath()%>/Intake.do?action=Search" style="text-decoration:none;">Search</a></br>
						<logic:notEmpty name="intakeForm" property="intake.intakeId">
							<img src="<%=request.getContextPath()%>/images/bullet.png"/><a href="<%=request.getContextPath()%>/Intake.do?action=personal" style="text-decoration:none;">Personal</a></br>
							<img src="<%=request.getContextPath()%>/images/bullet.png"/><a href="<%=request.getContextPath()%>/Intake.do?action=religious" style="text-decoration:none;">Spiritual</a></br>
							<img src="<%=request.getContextPath()%>/images/bullet.png"/><a href="<%=request.getContextPath()%>/Intake.do?action=substance" style="text-decoration:none;">Substance</a></br>
							<img src="<%=request.getContextPath()%>/images/bullet.png"/><a href="<%=request.getContextPath()%>/Intake.do?action=health" style="text-decoration:none;">Medical</a></br>
							<img src="<%=request.getContextPath()%>/images/bullet.png"/><a href="<%=request.getContextPath()%>/Intake.do?action=legal" style="text-decoration:none;">Legal</a></br>
							<img src="<%=request.getContextPath()%>/images/bullet.png"/><a href="<%=request.getContextPath()%>/Intake.do?action=accounting" style="text-decoration:none;">Accounting</a></br>
							<img src="<%=request.getContextPath()%>/images/bullet.png"/><a href="<%=request.getContextPath()%>/Intake.do?action=visitation" style="text-decoration:none;">Visitation</a></br>
							<img src="<%=request.getContextPath()%>/images/bullet.png"/><a href="<%=request.getContextPath()%>/Intake.do?action=discipline" style="text-decoration:none;">Discipline</a></br>
							<img src="<%=request.getContextPath()%>/images/bullet.png"/><a href="<%=request.getContextPath()%>/Intake.do?action=counseling" style="text-decoration:none;">Counseling</a></br>
							<img src="<%=request.getContextPath()%>/images/bullet.png"/><a href="<%=request.getContextPath()%>/Intake.do?action=status" style="text-decoration:none;">Status</a></br>
						</logic:notEmpty>
						<logic:empty name="intakeForm" property="intake.intakeId"  >
							<img src="<%=request.getContextPath()%>/images/bullet.png"/><font color="d3e3f8">Personal</font></br>
							<img src="<%=request.getContextPath()%>/images/bullet.png"/><font color="d3e3f8">Spiritual</font></br>
							<img src="<%=request.getContextPath()%>/images/bullet.png"/><font color="d3e3f8">Substance</font></br>
							<img src="<%=request.getContextPath()%>/images/bullet.png"/><font color="d3e3f8">Medical</font></br>
							<img src="<%=request.getContextPath()%>/images/bullet.png"/><font color="d3e3f8">Legal</font></br>
							<img src="<%=request.getContextPath()%>/images/bullet.png"/><font color="d3e3f8">Accounting</font></br>
							<img src="<%=request.getContextPath()%>/images/bullet.png"/><font color="d3e3f8">Pass/Visitation</font></br>
							<img src="<%=request.getContextPath()%>/images/bullet.png"/><font color="d3e3f8">Discipline</font></br>
							<img src="<%=request.getContextPath()%>/images/bullet.png"/><font color="d3e3f8">Counseling</font></br>
							<img src="<%=request.getContextPath()%>/images/bullet.png"/><font color="d3e3f8">Status</font></br>
						</logic:empty>
				</div>
			</div>
			</div>
			
			
			<div id="Accounting" style="position:absolute;top:105px;" >
			<div id="boxMenu">
					<div id="boxMenuHeader">Accounting</div>
					<div id="boxSubMenuItem">
						<img src="<%=request.getContextPath()%>/images/bullet.png"/>Search</br>
					</div>
			</div>
			</div>
			
	
			
			<div id="Reports" style="position:absolute;top:105px;" >
			<div id="boxMenu">
					<div id="boxMenuHeader">Reports</div>
					<div id="boxSubMenuItem">
						<img src="<%=request.getContextPath()%>/images/bullet.png"/>In-house Resident</br>
						<img src="<%=request.getContextPath()%>/images/bullet.png"/>Insurance Notice</br>
						<img src="<%=request.getContextPath()%>/images/bullet.png"/>Medication Supply</br>
						<img src="<%=request.getContextPath()%>/images/bullet.png"/>Housekeeping Status</br>
					</div>
			</div>
			</div>

			
</html:form>		
			
			 