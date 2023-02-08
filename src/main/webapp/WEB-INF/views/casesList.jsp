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
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#table_id').DataTable();
        });
    </script>
</head>

<body>
<div id="wrapper">
    <jsp:include page="header.jsp"/>
    <div id="container">
        <h2>List of cases</h2>
        <div class="table">
            <table id="table_id">
                <thead>
                <tr>
                    <th>No.</th>
                    <th>Case sign</th>
                    <th>Description</th>
                    <th>Date of initiation</th>
                    <th>End date</th>
                    <th>Comments</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${allCases}" var="oneCase" varStatus="count">
                    <tr>
                        <td>${count.count}.</td>
                        <td>${oneCase.caseSign}</td>
                        <td>${oneCase.description}</td>
                        <td>${oneCase.dateOfInitiation}</td>
                        <td>${oneCase.endDate}</td>
                        <td>${oneCase.comments}</td>
                        <td><a href="/documentsList/${oneCase.id}">Documents</a></td>
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
