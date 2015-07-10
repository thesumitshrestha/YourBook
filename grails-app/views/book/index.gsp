<%@ page import="yourBook.Book" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
            <table class="ui sortable celled table">
                <thead>
                    <tr>
                            <g:sortableColumn property="book_title" title="${message(code: 'book.book_title.label', default: 'Booktitle')}" />
                            <g:sortableColumn property="author" title="${message(code: 'book.author.label', default: 'Author')}" />
                            <g:sortableColumn property="book_pub" title="${message(code: 'book.book_pub.label', default: 'Bookpub')}" />
                            <g:sortableColumn property="publisher_name" title="${message(code: 'book.publisher_name.label', default: 'Publishername')}" />
                            <g:sortableColumn property="isbn" title="${message(code: 'book.isbn.label', default: 'Isbn')}" />
                            <g:sortableColumn property="copyright_year" title="${message(code: 'book.copyright_year.label', default: 'Copyrightyear')}" />
                            <g:sortableColumn property="noofBooks" title="${message(code: 'book.noofBooks.label', default: 'noofBooks')}" />
                            <h1></h1>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${bookInstanceList}" status="i" var="bookInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td><g:link action="show" id="${bookInstance.id}">${fieldValue(bean: bookInstance, field: "book_title")}</g:link></td>
                            <td>${fieldValue(bean: bookInstance, field: "author")}</td>
                            <td>${fieldValue(bean: bookInstance, field: "book_pub")}</td>
                            <td>${fieldValue(bean: bookInstance, field: "publisher_name")}</td>
                            <td>${fieldValue(bean: bookInstance, field: "isbn")}</td>
                            <td>${fieldValue(bean: bookInstance, field: "copyright_year")}</td>
                            <td>${fieldValue(bean: bookInstance, field: "noofBooks")}</td>
                                <g:if test="${bookInstance.noofBooks == 0}">
                                    <td><g:link class="large basic black animated fade ui button" controller="reserve" action="reserve" params='[bookId:"${bookInstance.id}", memberId:1]' onclick="return confirm('Press OK to Reserve');">
                                        <div class="visible content">Click here to reserve the book</div>
                                        <div class="hidden content">Reserve</div>
                                    </g:link></td>
                                </g:if>
                                <g:else>
                                    <td><g:link class="large basic black animated fade ui button" controller="borrow" action="create" params='[bookId:"${bookInstance.id}",bookName:"${bookInstance.book_title}"]'>
                                        <div class="visible content">Click here to borrow the book</div>
                                        <div class="hidden content">Borrow</div>
                                    </g:link></td>
                                </g:else>
                        </tr>
                </g:each>
               </tbody>
            </table>
		</div>
    <div class="pagination">
        <div class="ui center aligned segment" id="space">
            <g:paginate total="${bookInstanceCount ?: 0}" />
        </div>
    </div>
	</body>
</html>
