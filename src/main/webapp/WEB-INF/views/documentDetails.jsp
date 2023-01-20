<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <div class="table">
            <table>
                <caption>Document details</caption>
                <tr>
                    <th>Case sign:</th>
                    <td>${documentDetails.caseSign.caseSign}</td>
                </tr>
                <tr>
                    <th>Description:</th>
                    <td>${documentDetails.description}</td>
                </tr>
                <tr>
                    <th>Document Date:</th>
                    <td>${documentDetails.documentDate}</td>
                </tr>
                <tr>
                    <th>Sender:</th>
                    <td>${documentDetails.sender}</td>
                </tr>
                <tr>
                    <th>Recipient:</th>
                    <td>${documentDetails.recipient}</td>
                </tr>
                <tr>
                    <th>Document sign:</th>
                    <td>${documentDetails.documentSign}</td>
                </tr>
                <tr>
                    <th>Comments:</th>
                    <td>${documentDetails.comments}</td>
                </tr>
                <c:choose>
                    <c:when test="${documentDetails.dbFile != null}">
                        <tr>
                            <th>Attachment:</th>
                            <td><a href="/downloadFile/${documentDetails.dbFile.id}">Download</a></td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <th>Attachment:</th>
                            <form:form method="post" action="/addAttachment" enctype="multipart/form-data">
                                <td><input type="file" name="file"/>
                                    <button type="submit">Add</button>
                                </td>
                            </form:form>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </table>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
