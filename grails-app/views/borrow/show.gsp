
<%@ page import="yourBook.Borrow" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'borrow.label', default: 'Borrow')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-borrow" class="content scaffold-show" role="main" style="margin: 0px auto;width: 60%">
			<h1 style="text-align: center"><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="ui center aligned segment">
                    <div class="ui positive message">
                        <div class="header">
                            <h1 style="text-align: center">${flash.message}</h1>
                        </div>
                    </div>
                </div>
            </g:if>
            <div class="ui yellow segment">
				<g:if test="${borrowInstance?.date_borrow}">
					<span id="date_borrow-label" class="property-label"><g:message code="borrow.date_borrow.label" default="Dateborrow" />: </span>
					
						<span class="property-value" aria-labelledby="date_borrow-label"><g:formatDate format="yyyy/M/dd" date="${borrowInstance?.date_borrow}" /></span>
				</g:if>
            </div>
                <div class="ui red segment">

                    <g:if test="${borrowInstance?.due_date}">
					<span id="due_date-label" class="property-label"><g:message code="borrow.due_date.label" default="Duedate" />: </span>
					
						<span class="property-value" aria-labelledby="due_date-label"><g:formatDate format="yyyy/M/dd" date="${borrowInstance?.due_date}" /></span>
					
				</g:if>
			</div>

            <div class="ui green segment">

                <g:if test="${borrowInstance?.book}">
					<span id="book-label" class="property-label"><g:message code="borrow.book.label" default="Book" />: </span>
					
						<span class="property-value" aria-labelledby="book-label"><g:link controller="book" action="show" id="${borrowInstance?.book?.id}">${borrowInstance?.book?.encodeAsHTML()}</g:link></span>
					
				</g:if>
</div>
                <div class="ui blue segment">

                    <g:if test="${borrowInstance?.member}">
					<span id="member-label" class="property-label"><g:message code="borrow.member.label" default="Member" />: </span>
					
						<span class="property-value" aria-labelledby="member-label"><g:link controller="member" action="show" id="${borrowInstance?.member?.id}">${borrowInstance?.member?.encodeAsHTML()}</g:link></span>
				</g:if>

                    </div>

                <div class="ui black segment">
                    <g:if test="${borrowInstance.status != true}">
                            <g:if test="${borrowInstance?.returnedDate}">
					            <span id="returnedDate-label" class="negative"><g:message code="borrow.returnedDate.label" default="Returned Date" />: </span>
						        <span class="positive" aria-labelledby="returnedDate-label"><g:formatDate format="yyyy/M/dd" date="${borrowInstance?.returnedDate}" /></span>
				            </g:if>
                    </g:if>

                    <g:else>
                                <span id="returnedDate-label" class="negative"><g:message code="borrow.returnedDate.label" default="Returned Date" />:</span>
                              <td>  <span class="negative">"Not Returned"</span></td>
                            </g:else>
                </div>

                %{--<div class="ui grey segment">

                    --}%%{--<g:if test="${borrowInstance?.status}">
					<span id="status-label" class="property-label"><g:message code="borrow.status.label" default="Status" />: </span>
					
						<span class="property-value" aria-labelledby="status-label"><g:formatBoolean boolean="${borrowInstance?.status}" /></span>
					
				</g:if>--}%%{--
			</div>--}%
			<g:form url="[resource:borrowInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">

                <div class="ui buttons">
                    <button class="ui button"><g:link class="edit" action="edit" params='[borrowId:"${borrowInstance.id}"]' ><g:message code="default.button.edit.label" default="Edit" /></g:link>

                    </button>
                    <div class="or"></div>
                    <g:actionSubmit class="ui secondary button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </div>
			</g:form>
		</div>
	</body>
</html>
