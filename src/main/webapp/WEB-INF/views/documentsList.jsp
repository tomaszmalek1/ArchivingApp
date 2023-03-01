<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Archiving App</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css"/>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.min.css"/>
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.3.4/css/buttons.dataTables.min.css"/>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.4/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.4/js/buttons.html5.min.js"></script>
    <script src="/resources/js/main.js"></script>
</head>

<body>
<div id="wrapper">
    <jsp:include page="header.jsp"/>
    <div id="container">
        <h2>List of documents</h2>
        <div class="table">
            <table id="table_id_documents">
                <h3><a href="/casesList"><--Back</A></h3>
                <h3 id="caseSignClass">Case sign: ${caseSign.get().caseSign}</h3>
                <h3><a href="/addDocument/${caseSign.get().id}">Add document</a></h3>
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
