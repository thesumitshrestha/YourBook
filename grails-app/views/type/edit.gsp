<%@ page import="yourBook.Type" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Edit</title>
	</head>
	<body>
			<h1>Edit Type</h1>
			<g:hasErrors bean="${typeInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${typeInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:typeInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${typeInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
	</body>
</html>
