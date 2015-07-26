
<%@ page import="yourBook.Book" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<h1 style="text-align: center">Book Details</h1>
<div style="width: 50%;margin-left: 320px">
            <g:if test="${flash.message}">
                <div class="ui center aligned segment">
                    <div class="ui positive message">
                        <div class="header">
                            <h1 style="text-align: center">${flash.message}</h1>
                        </div>
                    </div>
                </div>            </g:if>
    <div class="ui red segment">
        <g:if test="${bookInstance?.book_title}">
            <b><span id="book_title-label" class="property-label"><g:message code="book.book_title.label" default="Booktitle" /> :</span></b>
            &nbsp;&nbsp;&nbsp;&nbsp; <span class="property-value" aria-labelledby="book_title-label"><g:fieldValue bean="${bookInstance}" field="book_title"/></span>
        </g:if>
    </div>
    <div class="ui blue segment">
        <g:if test="${bookInstance?.author}">
            <b><span id="author-label" class="property-label"><g:message code="book.author.label" default="Author" />:</span></b>
            <em>&nbsp;&nbsp;&nbsp;&nbsp;<span class="property-value" aria-labelledby="author-label"><g:fieldValue bean="${bookInstance}" field="author"/></span></em>
        </g:if>
    </div>
    <div class="ui black segment">
        <g:if test="${bookInstance?.book_pub}">
            <b><span id="book_pub-label" class="property-label"><g:message code="book.book_pub.label" default="Bookpub" />:</span></b>

            &nbsp;&nbsp;&nbsp;&nbsp;<em><span class="property-value" aria-labelledby="book_pub-label"><g:fieldValue bean="${bookInstance}" field="book_pub"/></span></em>
        </g:if>
    </div>

    <div class="ui yellow segment">
        <g:if test="${bookInstance?.publisher_name}">
            <b><span id="publisher_name-label" class="property-label"><g:message code="book.publisher_name.label" default="Publishername" />:</span></b>

            &nbsp;&nbsp;&nbsp;&nbsp;<em><span class="property-value" aria-labelledby="publisher_name-label"><g:fieldValue bean="${bookInstance}" field="publisher_name"/></span></em>
        </g:if>
    </div>
    <div class="ui green segment">
        <g:if test="${bookInstance?.isbn}">
            <b><span id="isbn-label" class="property-label"><g:message code="book.isbn.label" default="Isbn" />:</span></b>

            &nbsp;&nbsp;&nbsp;&nbsp;<em><span class="property-value" aria-labelledby="isbn-label"><g:fieldValue bean="${bookInstance}" field="isbn"/></span></em>
        </g:if>
    </div>
    <div class="ui purple segment">
        <g:if test="${bookInstance?.copyright_year}">
            <b><span id="copyright_year-label" class="property-label"><g:message code="book.copyright_year.label" default="Copyrightyear" />:</span></b>

            &nbsp;&nbsp;&nbsp;&nbsp;<em><span class="property-value" aria-labelledby="copyright_year-label"><g:fieldValue bean="${bookInstance}" field="copyright_year"/></span></em>
        </g:if>
    </div>
    <div class="ui red segment">
        <g:if test="${bookInstance?.noofBooks}">
            <b><span id="noofBooks-label" class="property-label"><g:message code="book.noofBooks.label" default="NoofBooks" />:</span></b>
            &nbsp;&nbsp;&nbsp;&nbsp;<em><span class="property-value" aria-labelledby="noofBooks-label"><g:fieldValue bean="${bookInstance}" field="noofBooks"/></span></em>
        </g:if>
    </div>
    %{-- <div class="ui blue segment">

         <g:if test="${bookInstance?.borrow}">
             <li class="fieldcontain">
                 <span id="borrow-label" class="property-label"><g:message code="book.borrow.label" default="Borrow" /></span>

                     <g:each in="${bookInstance.borrow}" var="b">
                     <span class="property-value" aria-labelledby="borrow-label"><g:link controller="borrow" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
                     </g:each>

             </li>
             </g:if>
         </div>--}%
    <div class="ui orange segment">

        <g:if test="${bookInstance?.category}">
            <b><span id="category-label" class="property-label"><g:message code="book.category.label" default="Category" />:</span></b>

            &nbsp;&nbsp;&nbsp;&nbsp;<em><span class="property-value" aria-labelledby="category-label"><g:link controller="category" action="show" id="${bookInstance?.category?.id}">${bookInstance?.category?.encodeAsHTML()}</g:link></span></em>
        </g:if>
    </div>
    <div class="ui grey segment">
        <g:form url="[resource:bookInstance, action:'delete']" method="DELETE">
            <div class="ui buttons">
                <button class="ui button"><g:link class="edit" action="edit" resource="${bookInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                </button>
                <div class="or"></div>
                <g:actionSubmit class="ui secondary button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </div>
        </g:form>

    </div>
</div>
</body>
</html>
