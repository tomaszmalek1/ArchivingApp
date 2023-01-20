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
                <tr>
                    <th>Attachment:</th>
                    <c:choose>
                        <c:when test="${documentDetails.dbFile != null}"><a href="#">Download</a></c:when>
                        <c:otherwise>
                            <form id="singleUploadForm" name="singleUploadForm">
                                <td><input id="singleFileUploadInput" type="file" name="file" class="file-input"
                                       required/>
                                <button type="submit">Add</button></td>
                            </form>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </table>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
