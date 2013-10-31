<jsp:include page="../../../includes/header.jsp" flush="true"/>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.dispatch.faithfarm.domain.ModuleRoster" %>
<%@ page import="org.faithfarm.cwt.CWTServlet" %>
<%@ page import="org.dispatch.faithfarm.util.Validator" %>

<%
	 Validator v8r = new Validator();
	 String message=(String)request.getAttribute("MESSAGE");
	 ArrayList results = (ArrayList) session.getAttribute("module_roster");
	 if (results==null)
	 	results=new ArrayList();
%>

<form method="POST" action="<%=request.getContextPath()%>/cwt">
    <h2>
        <%=CWTServlet.getModule().getModuleName() %> - Student Roster
    </h2>
    
            <p><b>Desciption</b><br/>
                <i><%=CWTServlet.getModule().getDescription() %></i>
            <br /><br/>
            Below are a list of students that are to jobs that have skills associated with the skills covered in the <%=CWTServlet.getModule().getModuleName() %> Class.
            </p>
            <% if (message!=null) { %>
            	<div class="success"><img src="<%=request.getContextPath() %>/img/success.png"/><%=message %></div>	
            <% } %>
            
            <div align="left">
            <table width="90%" cellpadding="0" cellspacing="0" class="searchResults">
            <tr>
            	<td>
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td class="colHeading" width="40">Enroll</td>
                    <td class="colSpacer" width="1"></td>
                    <td class="colHeading" width="150">Student Name</td>
                    <td class="colSpacer" width="1"></td>
                    <td class="colHeading" width="150">Department</td>
                    <td class="colSpacer" width="1"></td>
                    <td class="colHeading" width="150">Job Title</td>
                    <td class="colSpacer" width="1"></td>
                    <td class="colHeading" width="100">Supervisor</td>
                    <td class="colSpacer" width="1"></td>
                    <td class="colHeading" width="100">Entry Date</td>
                    <td class="colHeading" width="1"></td>  
                </tr>
               
                <% String rowClass="";
				   
				   for (int i=0;i<results.size();i++) { 
					  ModuleRoster roster = (ModuleRoster)results.get(i); 
					  if (i%2==0) 
					  	rowClass="Even"; 
					  else 
					    rowClass="Odd";	  
				%>
                <tr>
                    <td class="searchRow<%=rowClass%>">
                    	<input type="checkbox" name="student<%=roster.getIntakeId() %>" value="YES"/>
                    </td>
                    <td class="searchRowSpcr<%=rowClass%>"></td>
                    <td class="searchRow<%=rowClass%>" ><%=roster.getStudentName()%></td>
                    <td class="searchRowSpcr<%=rowClass%>"></td>
                    <td class="searchRow<%=rowClass%>" ><%=roster.getDepartment()%></td>
                    <td class="searchRowSpcr<%=rowClass%>"></td>
                    <td class="searchRow<%=rowClass%>" ><%=roster.getJobTitle()%></td>
                    <td class="searchRowSpcr<%=rowClass%>"></td>
                    <td class="searchRow<%=rowClass%>" ><%=roster.getSupervisor()%></td>
                    <td class="searchRowSpcr<%=rowClass%>"></td> 
                    <td class="searchRow<%=rowClass%>" ><%=roster.getEntryDate()%></td>
                    <td class="searchRow<%=rowClass%>"></td>                    
                </tr> 
                <% } %>
               
               

                </table>
                </td>
            </tr>
            </table>
            
            <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
            	<td height="23" valign="center" align="left">
            		<input type="submit" name="action" value="Save Roster" class="button"/>
            	</td>
            </tr>
           	</table>
        	</div>

        </div>
        <div class="clear">
        </div>
    </div>
    <div class="footer">
        
    </div>
   
</form>
</body>
</html>
