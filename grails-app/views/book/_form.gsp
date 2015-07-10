<%@ page import="yourBook.Book" %>


%{--<div class="field ${hasErrors(bean: bookInstance, field: 'book_title', 'error')} required">
    <div class="field">
            <label> Book Title</label>
           &nbsp;&nbsp; <input type="text" name="book_title" placeholder="Book Title" required="" value="${bookInstance?.book_title}">
    </div>
</div>--}%

<div class="ui form">
    <div class="required field">
        <label>Book Title</label>
        <input type="text" name="book_title" required="" placeholder="Title Of The Book" value="${bookInstance?.book_title}">
<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'author', 'error')} required">
    <label for="author">
        <g:message code="book.author.label" default="Author" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="author" required="" placeholder="Author of the Book" value="${bookInstance?.author}"/>
</div>
</br>
<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'book_pub', 'error')} required">
    <label for="book_pub">
        <g:message code="book.book_pub.label" default="Bookpub" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="book_pub" required="" placeholder="Publication" value="${bookInstance?.book_pub}"/>

</div>
</br>
<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'publisher_name', 'error')} ">
    <label for="publisher_name">
        <g:message code="book.publisher_name.label" default="Publishername" />

    </label>
    <g:textField name="publisher_name" placeholder="Publisher Name" value="${bookInstance?.publisher_name}"/>

</div>
</br>
<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'isbn', 'error')} required">
    <label for="isbn">
        <g:message code="book.isbn.label" default="Isbn" />
        <span class="required-indicator">*</span>
    </label>
    <g:field name="isbn" type="number" placeholder="ISBN" value="${bookInstance.isbn}" required=""/>

</div>
</br>
<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'copyright_year', 'error')} required">
    <label for="copyright_year">
        <g:message code="book.copyright_year.label" default="Copyrightyear" />
        <span class="required-indicator">*</span>
    </label>
    <g:field name="copyright_year" type="number" placeholder="Copyright Year" value="${bookInstance.copyright_year}" required=""/>

</div>
</br>
<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'noofBooks', 'error')} required">
    <label for="noofBooks">
        <g:message code="book.noofBooks.label" default="Noof Books" />
        <span class="required-indicator">*</span>
    </label>
    <g:field name="noofBooks" type="number" value="${bookInstance.noofBooks}" placeholder="Available Book Number" required=""/>

</div>
%{--
<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'borrow', 'error')} ">
    <label for="borrow">
        <g:message code="book.borrow.label" default="Borrow" />

    </label>

<ul class="one-to-many">
<g:each in="${bookInstance?.borrow?}" var="b">
    <li><g:link controller="borrow" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="borrow" action="create" params="['book.id': bookInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'borrow.label', default: 'Borrow')])}</g:link>
</li>
</ul>

</div>--}%
</br>
<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'category', 'error')} required">
    <label for="category">
        <g:message code="book.category.label" default="Category" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="category" name="category.id" from="${yourBook.Category.list()}" optionKey="id" required="" value="${bookInstance?.category?.id}" class="many-to-one"/>
</div>
    </div>

</div>

