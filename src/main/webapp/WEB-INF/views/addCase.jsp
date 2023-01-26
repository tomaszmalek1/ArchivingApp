<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Archiving App</title>
    <link rel="stylesheet" type="text/css" href="resources/css/style.css"/>
</head>

<body>
<div id="wrapper">
    <jsp:include page="header.jsp"/>
    <div id="container">
        <h2>Adding a case</h2>
        <%--@elvariable id="case" type=""--%>
        <form:form method="post" modelAttribute="case">
            <div class="table">
                <table>
                    <tr>
                        <th>Case sign:</th>
                        <td><form:input path="caseSign"/><br><form:errors path="caseSign" cssClass="errors"/></td>
                    </tr>
                    <tr>
                        <th>Description:</th>
                        <td><form:textarea rows="2" cols="50" path="description"/><br><form:errors path="description"
                                                                                                   cssClass="errors"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Date of initiation:</th>
                        <td><form:input type="date" path="dateOfInitiation"/><br><form:errors path="dateOfInitiation"
                                                                                              cssClass="errors"/></td>
                    </tr>
                    <tr>
                        <th>End date:</th>
                        <td><form:input type="date" path="endDate"/><br><form:errors path="endDate" cssClass="errors"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Comments:</th>
                        <td><form:textarea rows="2" cols="50" path="comments"/></td>
                    </tr>
                </table><br>
                <div class="button_center">
                    <button type="submit" class="btn">Add</button>
                </div>
            </div>
        </form:form>
    </div>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
