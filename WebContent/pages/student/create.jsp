<%@ page import="org.faithfarm.cwt.CWTServlet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.ArrayList" %>

<%
    String message=(String)request.getAttribute("MESSAGE");

	String programNameErr = (String)request.getAttribute("programNameErr");
	if (programNameErr==null) programNameErr="";
	String statusErr = (String)request.getAttribute("statusErr");
	if (statusErr==null) statusErr="";
%>

<jsp:include page="../../../includes/header.jsp" flush="true"/>





<form method="POST" action="<%=request.getContextPath()%>/cwt">
    <h2>
        Course Work Therapy - Create Program
    </h2>
    
       <br />
       		<% if ((programNameErr+statusErr).length()>0) { %>
            <span class="failureNotification">
                <ul>
                	<% if (programNameErr.length()>0) { %>
					<li><%=programNameErr%></li>
                    <% } if (statusErr.length()>0) { %>
                    <li><%=statusErr%></li>
                    <% } %>
                </ul>
            </span>
            <% } %>
            <% if (message!=null) { %>
            	<div class="success"><img src="<%=request.getContextPath() %>/img/success.png"/><%=message %></div>	
            <% } %>
       <br />
            <div align="left">
            
            Program Name<br /><input type="text" name="programName" value="<%=CWTServlet.getProgram().getProgramName()%>" size="30" maxlength="50"/><br /><br />
            Description<br /><textarea name="description" cols="40" rows="5"><%=CWTServlet.getProgram().getDescription()%></textarea><br />
        	 Status<br/>
              				<%
                            ArrayList ddl = (ArrayList)session.getAttribute("dllCWTStatus");
                            %>
                            <select name="status">
                            <option value=""></option>
                            <%
                            if (ddl!=null) {
                              for (int i=0;i<ddl.size();i++) {
								  String opt = (String)ddl.get(i);
                                %>
                                <option 
                                    value="<%=opt%>"
                                    <%
                                    if
                                    (opt.equals(CWTServlet.getProgram().getStatus()))
                                    {%>selected<%}%>>
                                  <%=opt%>
                                </option>
                                <%
                              }
                              %>
                              <%
                            }
                        %></select>
               <br /><br />
            <br />
            <input type="submit" name="action" value="Save Program" class="button"/>&nbsp;
            <input type="reset" name="action" value="Clear" class="button"/>
            	
             </div>
    </div>
    <div class="footer">
        Faith Farm Ministries &copy;2013
    </div>
   
</form>
</body>
</html>
