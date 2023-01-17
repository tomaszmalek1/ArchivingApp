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
        <div id="add_document_form">
            <h2>Adding a document</h2>
            <%--@elvariable id="document" type=""--%>
            <form:form method="post" modelAttribute="document" id="singleUploadForm" name="singleUploadForm">
                <%--                <div class="form-section form-section--columns">--%>
                <%--                    <div class="form-section--column">--%>
                <%--                        <div class="form-group form-group--inline">--%>
                <%--                            <label>--%>
                <%--                                Opis dokumentu1 <form:input path="description"/>--%>
                <%--                            </label>--%>
                <%--                        </div>--%>
                <%--                        <div class="form-group form-group--inline">--%>
                <%--                            <label>--%>
                <%--                                Opis dokumentu1 <form:input path="description2"/>--%>
                <%--                            </label>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
                Znak sprawy (Wewnętrzny)
                <form:select path="caseSign">
                    <c:forEach var="aCase" items="${cases}">
                        <form:option value="${aCase}">${aCase.caseSign}</form:option>
                    </c:forEach>
                </form:select><br>
                Opis dokumentu <form:textarea rows="2" cols="50" path="description"/><br>
                Data dokumentu <form:input type="date" path="documentDate"/><br>
                Nadawca <form:input path="sender"/><br>
                Odbiorca <form:input path="recipient"/><br>
                Znak dokumentu <form:input path="documentSign"/><br>
                Uwagi <form:textarea rows="2" cols="50" path="comments"/><br>


<%--                <h3>Upload Single File</h3>--%>
<%--                <form:input path="dbFile" id="singleFileUploadInput" type="file" name="file" class="file-input"/>--%>
                <button type="submit" class="btn">Dodaj</button>
            </form:form>

            <%--            Dodawanie pliku, narazie bez powiązania z dokumentem--%>

            <%--            <h3>Upload Single File</h3>--%>
            <%--            <form id="singleUploadForm" name="singleUploadForm">--%>
            <%--                <input id="singleFileUploadInput" type="file" name="file" class="file-input" required/>--%>
            <%--                <button type="submit" class="primary submit-btn">Submit</button>--%>
            <%--            </form>--%>
            <%--            <div class="upload-response">--%>
            <%--                <div id="singleFileUploadError"></div>--%>
            <%--                <div id="singleFileUploadSuccess"></div>--%>
            <%--            </div>--%>

            <%--            Koniec dodawania pliku--%>

        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
