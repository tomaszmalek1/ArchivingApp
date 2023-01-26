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
        <div class="table">
            <table>
                <thead>
                <tr>
                    <%--                    <th>No.</th>--%>
                    <th>Document sign</th>
                    <th>Description</th>
                    <th>Details</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${documentsList}" var="document">
                    <%--                        <c:forEach var="no" begin="1" end="8">--%>
                    <tr>
                            <%--                            <td>${no}</td>--%>
                        <td>${document.documentSign}</td>
                        <td>${document.description}</td>
                        <td><a href="/documentDetails/${document.id}">CLICK</a></td>
                    </tr>
                </c:forEach>
                <%--                </c:forEach>--%>
                </tbody>
            </table>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
