<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" /></title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>

    <header class="container-fluid">
        <tiles:insertAttribute name="header" />
    </header>
    
    <nav>
        <tiles:insertAttribute name="menu" />
    </nav>
    
    <div id="content" class="container-fluid">
        <tiles:insertAttribute name="body" />
    </div>
    
    <footer>
        <tiles:insertAttribute name="footer" />
    </footer>

</body>
</html>