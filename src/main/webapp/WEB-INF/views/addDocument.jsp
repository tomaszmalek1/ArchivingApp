<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Archiving App</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css"/>
</head>

<body>
<div id="wrapper">
    <jsp:include page="header.jsp"/>
    <div id="container">
        <h2>Adding a document</h2>
        <%--@elvariable id="document" type=""--%>
        <form:form method="post" modelAttribute="document" enctype="multipart/form-data">
            <div class="table">
                <table>
                    <h3><a href="javascript:history.back();"><--Back</A></h3>
                    <h3>Case sign: ${aCase.get().caseSign}</h3>
                    <form:hidden path="caseSign" value="${aCase.get().id}"/>
                    <br><form:errors path="caseSign" cssClass="errors"/>

                    <tr>
                        <th>Description:</th>
                        <td><form:textarea rows="2" cols="50" path="description"/><br><form:errors path="description"
                                                                                                   cssClass="errors"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Document date:</th>
                        <td><form:input type="date" path="documentDate"/><br><form:errors path="documentDate"
                                                                                          cssClass="errors"/></td>
                    </tr>
                    <tr>
                        <th>Sender:</th>
                        <td><form:input path="sender"/><br><form:errors path="sender" cssClass="errors"/></td>
                    </tr>
                    <tr>
                        <th>Recipient:</th>
                        <td><form:input path="recipient"/><br><form:errors path="recipient" cssClass="errors"/></td>
                    </tr>
                    <tr>
                        <th>Document Sign:</th>
                        <td><form:input path="documentSign"/><br><form:errors path="documentSign" cssClass="errors"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Comments:</th>
                        <td><form:textarea rows="2" cols="50" path="comments"/></td>
                    </tr>
                    <tr>
                        <th>Add Attachment:</th>
                        <td><input type="file" name="file"/></td>
                    </tr>
                </table>
                <br>
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
