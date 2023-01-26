<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <thead>
                <tr>
                    <th>Case sign</th>
                    <th>Description</th>
                    <th>Date of initiation</th>
                    <th>End date</th>
                    <th>Comments</th>
                    <th>Documents</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${allCases}" var="oneCase">
                    <tr>
                        <td>${oneCase.caseSign}</td>
                        <td>${oneCase.description}</td>
                        <td>${oneCase.dateOfInitiation}</td>
                        <td>${oneCase.endDate}</td>
                        <td>${oneCase.comments}</td>
                        <td><a href="/documentsList/${oneCase.id}">CLICK</a></td>
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
