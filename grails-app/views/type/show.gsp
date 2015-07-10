
<%@ page import="yourBook.Type" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'type.label', default: 'Type')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-type" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
            <div class="ui blue segment">
				<g:if test="${typeInstance?.type}">
					<span id="type-label" class="property-label"><g:message code="type.type.label" default="Type" />: </span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${typeInstance}" field="type"/></span>
									</g:if>
			</div>

            <div class="ui red segment">
                <g:if test="${typeInstance?.member}">
					<span id="member-label" class="property-label"><g:message code="type.member.label" default="Member" />: </span>
					
						<g:each in="${typeInstance.member}" var="m">
						<span class="property-value" aria-labelledby="member-label"><g:link controller="member" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</g:if>
			</div>


			<g:form url="[resource:typeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${typeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
