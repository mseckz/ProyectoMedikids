<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="${pageContext.request.contextPath}/externo/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/externo/css/signin.css"
	rel="stylesheet" type="text/css">

<title><s:text name="parrafo.login" /></title>
<s:head />

</head>
<body>
	<div class="container">

		<s:form action="loginUsuario" namespace="/seguridad"
			cssClass="form-signin">
			<img src="<s:url value="/images/logos/logo.png" namespace="/"/>"
				class="form-control-mod" />
			<h2 class="form-signin-heading">
				<s:text name="parrafo.login" />
			</h2>
			<s:textfield name="usuario.cuenta" cssClass="form-control"
				placeholder="%{getText('label.usuario')}" />
			<s:password name="usuario.contrasena" cssClass="form-control"
				placeholder="%{getText('label.password')}" />
			<s:submit value="%{getText('accion.loguear')}"
				cssClass="btn btn-lg btn-primary btn-block" />
			<s:actionerror />	
		</s:form>
	</div>
	
	<hr/>
	<a href="<s:url action="iniciarPrincipal" namespace="/seguridad"/>">
		<s:text name="Pasa_a_siguiente_pagina" />
	</a>

</body>
</html>





