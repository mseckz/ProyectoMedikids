<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<sj:head/>
    <title><s:text name="parrafo.proyecto"/></title>

    <!-- Bootstrap Core CSS -->
    <link href="<s:url value='/externo/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<s:url value='/externo/css/sb-admin.css'/>" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<s:url value='/externo/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">
    
    <!-- Custom CSS -->
    <link href="<s:url value='/externo/css/simple-sidebar.css'/>" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link href="<s:url value='/externo/css/sticky-footer.css'/>" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
 	<div id="wrapper">
 		
        <!-- Navigation -->
		<tiles:insertAttribute name="cabecera"/>
        <!-- Navigation -->
        
        <!-- Sidebar -->
		<tiles:insertAttribute name="menu"/>
        <!-- /#sidebar-wrapper -->
        

		<!-- Page Content -->
        <tiles:insertAttribute name="contenido"/>
        <!-- /#page-content-wrapper -->
        
        <!-- Footer -->
		<tiles:insertAttribute name="pie"/>
 		<!-- Footer -->

    </div>
    <div id="1">

    </div>

   

			    
    <!-- /#wrapper -->

    <!-- jQuery 
    <script src="externo/bootstrap/js/jquery.js"></script>-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/externo/bootstrap/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript 
    <script src="externo/bootstrap/js/bootstrap.min.js"></script>-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/externo/bootstrap/js/bootstrap.min.js"></script>
    
    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>

</body>
</html>










