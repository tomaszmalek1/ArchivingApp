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
        <div id="add_document_form">
            <h2>Adding a case</h2>
            <%--@elvariable id="case" type=""--%>
            <form:form method="post" modelAttribute="case">
                Znak sprawy (Wewnętrzny) <form:input path="caseSign"/><br>
                Opis dokumentu <form:textarea rows="2" cols="50" path="description"/><br>
                Data wszczęcia sprawy <form:input type="date" path="dateOfInitiation"/><br>
                Data zakończenia sprawy <form:input type="date" path="endDate"/><br>
                Uwagi <form:textarea rows="2" cols="50" path="comments"/><br>
                <button type="submit" class="btn">Dodaj</button>
            </form:form>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
