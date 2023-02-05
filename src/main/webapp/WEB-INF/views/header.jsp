<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="logo">
    <a href="#">
        <h2>Archiving App</h2>
    </a>
</div>

<div id="menu">
    <div id="search_top">
        <form method="post" action="/searchByCaseSign" enctype="multipart/form-data">
            <input type="text" size="30" name="caseSign" placeholder="Search a case"/>
        </form>
    </div>
    <ul>
        <li><a href="/">Home</a></li>
        <li><a href="#">About</a></li>
        <%--        <li><a href="#">Offer</a></li>--%>
        <li><a href="#">Contact</a></li>
        <li><a href="/casesList">Cases</a></li>
        <li><a href="/addCase">Add case</a></li>
        <li><a href="/addDocument">Add document</a></li>
    </ul>
</div>
