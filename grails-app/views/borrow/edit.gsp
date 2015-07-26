<%@ page import="yourBook.Borrow" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'borrow.label', default: 'Borrow')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="edit-borrow" class="content scaffold-edit" role="main" style="margin: 0px auto;width:1200px">
			<h1 style="text-align: center"><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${borrowInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${borrowInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:borrowInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${borrowInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
                <div class="large ui buttons">
                    <br>
					 <g:actionSubmit class="ui inverted blue button" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </div>
			</g:form>
		</div>
	</body>
</html>
