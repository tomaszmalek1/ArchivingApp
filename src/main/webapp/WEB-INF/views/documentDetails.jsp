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
        <div id="document_details">
            <table>
                <caption>Szczegóły dokumentu</caption>
                <tr>
                    <th>Znak sprawy (Wewnętrzny):</th>
                    <td>${documentDetails.caseSign.caseSign}</td>
                </tr>
                <tr>
                    <th>Opis dokumentu:</th>
                    <td>${documentDetails.description}</td>
                </tr>
                <tr>
                    <th>Data dokumentu:</th>
                    <td>${documentDetails.documentDate}</td>
                </tr>
                <tr>
                    <th>Nadawca:</th>
                    <td>${documentDetails.sender}</td>
                </tr>
                <tr>
                    <th>Odbiorca:</th>
                    <td>${documentDetails.recipient}</td>
                </tr>
                <tr>
                    <th>Znak dokumentu:</th>
                    <td>${documentDetails.documentSign}</td>
                </tr>
                <tr>
                    <th>Uwagi:</th>
                    <td>${documentDetails.comments}</td>
                </tr>

            </table>
<%--            Znak sprawy (Wewnętrzny): ${documentDetails.caseSign.caseSign}--%>
            <%--            Opis dokumentu: ${documentDetails.description}--%>
            <%--            Data dokumentu: ${documentDetails.documentDate}--%>
            <%--            Nadawca: ${documentDetails.sender}--%>
            <%--            Odbiorca: ${documentDetails.recipient}--%>
            <%--            Znak dokumentu: ${documentDetails.documentSign}--%>
            <%--            Uwagi: ${documentDetails.comments}--%>

            <h3>Upload attachment</h3>
            <form id="singleUploadForm" name="singleUploadForm">
                <input id="singleFileUploadInput" type="file" name="file" class="file-input" required/>
                <button type="submit" class="primary submit-btn">Dodaj</button>
            </form>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
