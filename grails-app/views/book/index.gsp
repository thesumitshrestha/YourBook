<%@ page import="yourBook.Book" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <style type="text/css">
    #space a{
        padding-left: 15px;
        padding-right: 15px;
        }
        #space{
            text-align: center;
            font-size: 24px;
            margin: 0px auto;
            width: 50%;
        }
    </style>
</head>
<body>
<br>

<g:if test ="${bookInstanceList}">


<g:if test="${flash.message}">
    <div class="ui center aligned segment">
        <div class="ui positive message">
            <div class="header">
                <h1 style="text-align: center">${flash.message}</h1>
            </div>
        </div>
    </div>
</g:if>
<p style="text-align: center;font-size: 24px">Book List</p>
<table class="ui sortable celled table" style="margin: 0px auto;width: 95%">
    <thead>
    <tr>
        <g:sortableColumn  style="text-align: center;" property="book_title" title="${message(code: 'book.book_title.label', default: 'Booktitle')}" />
        <g:sortableColumn  style="text-align: center;" property="author" title="${message(code: 'book.author.label', default: 'Author')}" />
        <g:sortableColumn  style="text-align: center;" property="book_pub" title="${message(code: 'book.book_pub.label', default: 'Bookpub')}" />
        <g:sortableColumn style="text-align: center;" property="publisher_name" title="${message(code: 'book.publisher_name.label', default: 'Publishername')}" />
        <g:sortableColumn style="text-align: center;" property="isbn" title="${message(code: 'book.isbn.label', default: 'Isbn')}" />
        <g:sortableColumn style="text-align: center;" property="copyright_year" title="${message(code: 'book.copyright_year.label', default: 'Copyrightyear')}" />
        <g:sortableColumn style="text-align: center;" property="noofBooks" title="${message(code: 'book.noofBooks.label', default: 'No of Books Available')}" />
        <g:sortableColumn style="text-align: center;" property="category" title="${message(code: 'book.category.label', default: 'Category')}" />
        <th style="text-align: center;color: #009fda">Action</th>
    </tr>
    </thead>
    <tbody style="text-align: center;">
    <g:each in="${bookInstanceList}" status="i" var="bookInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
        <g:if test="${session.userRole=="Admin"}">
            <td  style="text-align: center;"><g:link action="show" id="${bookInstance.id}">${fieldValue(bean: bookInstance, field: "book_title")}</g:link></td>
         </g:if>
           <g:else>
               <td  style="text-align: center;">${fieldValue(bean: bookInstance, field: "book_title")}</td>
           </g:else>
            <td  style="text-align: center;">${fieldValue(bean: bookInstance, field: "author")}</td>
            <td style="text-align: center;">${fieldValue(bean: bookInstance, field: "book_pub")}</td>
            <td style="text-align: center;">${fieldValue(bean: bookInstance, field: "publisher_name")}</td>
            <td style="text-align: center;">${fieldValue(bean: bookInstance, field: "isbn")}</td>
            <td style="text-align: center;">${fieldValue(bean: bookInstance, field: "copyright_year")}</td>
            <td style="text-align: center;">${fieldValue(bean: bookInstance, field: "noofBooks")}</td>
            <td style="text-align: center;">${fieldValue(bean: bookInstance, field: "category")}</td>
            <g:if test="${bookInstance.noofBooks == 0}">
                <g:if test="${session.userRole=="Student"}">
                <td style="text-align: center;"><g:link class="large basic black animated fade ui button" controller="reserve" action="reserve" params='[bookId:"${bookInstance.id}", memberId:session.memberId]' onclick="return confirm('Press OK to Reserve');">
                    <div class="visible content">Click here to reserve the book</div>
                    <div class="hidden content">Reserve</div>
                </g:link></td>
                 </g:if>
                <g:else>
                    <td style="text-align: center;">
                        <div class="visible content"><b>Student will have to reserve the book.</b></div>
                    </td>
                </g:else>
            </g:if>
            <g:else>
                <g:if test="${session.userRole=="Admin"}">
                    <td style="text-align: center;"><g:link class="large basic black animated fade ui button" controller="borrow" action="create" params='[bookId:"${bookInstance.id}"]'>
                        <div class="visible content">Click here to borrow the book</div>
                        <div class="hidden content">Borrow</div>
                    </g:link></td>
                </g:if>
                <g:else>
                    <td style="text-align: center;">
                        <div class="visible content"><b>The book is available at library.</b></div>
                    </td>
                </g:else>
            </g:else>
        </tr>
    </g:each>
    </tbody>
</table>
<br>
    <div id="space">
        <g:paginate total="${bookInstanceCount ?: 0}" />
    </div>
</div>
</g:if>
<g:else>
        <div class="ui center aligned segment">
            <div class="ui positive message">
                <div class="header">
                    <h1 style="text-align: center">No Book Found</h1>
                </div>
            </div>
        </div>
</g:else>
</body>
</html>
