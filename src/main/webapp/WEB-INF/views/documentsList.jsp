<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <h2>List of documents</h2>
        <div class="table">
            <table>
                <h3>Case sign: ${caseSign}</h3>
                <thead>
                <tr>
                    <th>No.</th>
                    <th>Document sign</th>
                    <th>Document date</th>
                    <th>Description</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${documentsList}" var="document" varStatus="count">
                    <tr>
                        <td>${count.count}.</td>
                        <td>${document.documentSign}</td>
                        <td>${document.documentDate}</td>
                        <td>${document.description}</td>
                        <td><a href="/documentDetails/${document.id}/${document.caseSign.id}">Details</a>
                            <c:choose>
                            <c:when test="${document.dbFile != null}">
                            <a href="/downloadFile/${document.dbFile.id}">Download</a></td>
                        </c:when>
                        <c:otherwise>
                            <a href="/documentDetails/${document.id}/${document.caseSign.id}">Add</a></td>
                        </c:otherwise>
                        </c:choose>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
