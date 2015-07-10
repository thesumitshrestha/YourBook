
<%@ page import="yourBook.Reserve" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reserve.label', default: 'Reserve')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <style type="text/css">
            #space a{
                padding-left: 15px;
                padding-right: 15px;
            }
         </style>
        <script>
            function fnOpenNormalDialog() {
                $.msgBox({
                    title: "Delete",
                    content: "Are you sure?",
                    type: "alert",
                    opacity: 0.5,
                    buttons: [{ value: "Yes" },{value: "No"}],
                    success: function (result) {
                        if (result == "Yes") {
                            return true
                        }else{
                            return false
                        }
                    }
                });
            }
            </script>
	</head>
	<body id="backgr">
    </div>		<div id="list-reserve" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>

			<g:if test="${flash.message}">
                <div class="ui center aligned segment">
                <div class="ui positive message">
                           <div class="header">
                <h1 style="text-align: center">${flash.message}</h1>
                </div>
                </div>
</div>
            </g:if>
			<table class="ui celled table">
			<thead>
					<tr>
                        <th> Book </th>
                        <th> Member </th>
					</tr>
				</thead>
                
				<tbody>
				<g:each in="${reserveInstanceList}" status="i" var="reserveInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <g:if test="${reserveInstance.id}">
                            <td><div class="title_column" id="${reserveInstance.id}">${fieldValue(bean: reserveInstance, field: "book")}</div></td>
                            <td><div class="title_column" id="${reserveInstance.id}">${fieldValue(bean: reserveInstance, field: "member")}</div></td>
                            <td><div class="title_column">
                                <div class="ui white labeled icon button">
                                    <i class="mail icon"> </i>  <g:link action="mail" params='[mId:"${reserveInstance.member.id}",BId:"${reserveInstance.book.id}"]'>Send Mail</g:link>
                                </div>
                                <div class="ui small modal">
                                <td><g:link onclick="return confirm('Press OK to Reserve');" controller="reserve" action="deleteReserve" params='[rid:"${reserveInstance.id}"]' >Delete</g:link>
                                </td>
                                    %{--<g:form controller="reserve" action="deleteReserve">
                                        <td><g:submitButton onclick=" return fnOpenNormalDialog()" name="button" value="Delete"> Delete </g:submitButton> </td>
                                    </g:form>--}%
                                </div>

                            </div></td>
                        </g:if>
                    </tr>
				</g:each>
				</tbody>
			</table>
          </div>
    %{--<div class="pagination">
    </div>--}%
    <div class="pagination">
        <div class="ui center aligned segment" id="space">
            <g:paginate total="${reserveInstanceCount ?: 0}" />
        </div>
    </div>
	</body>
</html>
