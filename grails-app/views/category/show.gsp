
<%@ page import="yourBook.Category" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'category.label', default: 'Category')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
    <script src="${resource(dir: 'js', file: 'jquery.msgBox.js')}"></script>
    <link href="${resource(dir: 'css', file: 'msgBoxLight.css')}" rel="stylesheet">
    %{--<script type="text/javascript">
        $(document).ready(function(){
            alert("Hiding the div")
            (".deleteForm").hide()
                });

        function fnOpenNormalDialog() {
            alert("Here");
            $.msgBox({
                title: "Delete",
                content: "Are you sure? This will delete all data related to this category",
                type: "alert",
                opacity: 0.5,
                buttons: [{ value: "Yes" },{value: "No"}],
                success: function (result) {
                    if (result == "Yes") {
                        alert("Please click the delete button")
                        ("#deleteForm").show()
                        return false

                    }else{
                        return false
                    }
                }
            });
        }
    </script>--}%
</head>
<body>
<div id="show-category" class="content scaffold-show" role="main">
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
    <div class="ui red segment" style="margin: 0px auto;width: 820px">

        <g:if test="${categoryInstance?.name}">
            <span id="name-label" class="property-label"><g:message code="category.name.label" default="Name" />: </span>

            <i><span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${categoryInstance}" field="name"/></span></i>

        </g:if>
    </div>
    <br>
    <div class="ui blue segment" style="margin: 0px auto;width: 820px">
        <g:if test="${categoryInstance?.book}">
            <span id="book-label" class="property-label"><g:message code="category.book.label" default="Book" />: </span>

            <g:each in="${categoryInstance.book}" var="b">
                <span style="padding: 8px" class="property-value" aria-labelledby="book-label"><g:link controller="book" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
            </g:each>
        </g:if>
    </div><br>

    <g:form style="text-align: center" url="[resource:categoryInstance, action:'delete']" method="DELETE" name="categoryForm">
        <div class="ui buttons" style="margin:0px auto;width: 820px">
            <button class="ui button">
                <g:link class="edit" action="edit" resource="${categoryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            </button>
            <div class="or"></div>
            <g:actionSubmit class="ui secondary button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirms.message', default: 'Are you sure?')}');" />
%{--
            <g:actionSubmit onsubmit="return fnOpenNormalDialog();" class="ui secondary button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" />
--}%
        </div>
    </g:form>%{--
</div>
    <input type="button" onclick="fnOpenNormalDialog()"/>




</div>--}%
</body>
</html>
