<%@ page import="yourBook.Borrow" %>

<div class="ui form">
    <div class="fieldcontain ${hasErrors(bean: borrowInstance, field: 'date_borrow', 'error')} required">
        <div class="ui compact menu">
            <div class="ui simple dropdown item">
                <label for="date_borrow">
                    <g:message code="borrow.date_borrow.label" default="Dateborrow" />
                    <span class="required-indicator">*</span>
                </label>
                <i class="dropdown icon"></i>
                <div class="menu">
                    <div class="item"><g:datePicker name="date_borrow" precision="day" value="${borrowInstance?.date_borrow}"/></div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="fieldcontain ${hasErrors(bean: borrowInstance, field: 'due_date', 'error')} required">

        <div class="ui compact menu">
            <div class="ui simple dropdown item">
                <label for="due_date">
                    <g:message code="borrow.due_date.label" default="Duedate" />
                    <span class="required-indicator">*</span>
                </label>
                <i class="dropdown icon"></i>
                <div class="menu">
                    <div class="item">%{--<g:datePicker name="due_date" precision="day" value="${borrowInstance?.due_date}"/>--}%
                        <p> Between <input type="text" id="datepickers"> </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br><br>
    <div class="fieldcontain ${hasErrors(bean: borrowInstance, field: 'book', 'error')} required">
        <label for="book">
            <g:message code="borrow.book.label" default="Book" />
            <span class="required-indicator">*</span>
        </label>
        <g:if test="${action=="createBorrow"}">
            <g:textField name="bookName" value="${bookInstance.book_title}" readonly=""/>
            <g:hiddenField name="bookId" value="${bookInstance.id}"/>
        </g:if>
        <g:else>
            <g:textField name="bookName" value="${borrowInstance.book.id}" readonly=""/>
            <g:hiddenField name="bookId" value="${borrowInstance.book.id}"/>
        </g:else>
    </div>

    <div class="fieldcontain ${hasErrors(bean: borrowInstance, field: 'member', 'error')} required">
        <label for="member">
            <g:message code="borrow.member.label" default="Member" />
            <span class="reqzuired-indicator">*</span>
        </label>
        <g:if test="${action=="edit"}">
            <g:textField id="member" name="stdRoll" value="${borrowInstance?.member?.encodeAsHTML()}" readonly=""/>
        </g:if>
        <g:elseif test="${action=="createBorrow"}">
            <g:textField name="stdRoll" placeholder="Enter member Roll Number" id="member" required=""/>
        </g:elseif>
        <g:else>
            <g:textField id="member" optionKey="id" name="stdRoll" required="" class="many-to-one" value="${borrowInstance?.member?.id}"/>
        </g:else>
    </div>

    <br><br>
    <div class="fieldcontain ${hasErrors(bean: borrowInstance, field: 'returnedDate', 'error')} required">
        <div class="ui compact menu">
            <div class="ui simple dropdown item">
                <label for="returnedDate">
                    <g:message code="borrow.returnedDate.label" default="Returned Date" />
                    <span class="required-indicator">*</span>
                </label>
                <i class="dropdown icon"></i>
                <div class="menu">
                    <div class="item">
                        <g:datePicker name="returnedDate" precision="day"  value="${borrowInstance?.returnedDate}"  />

                    </div>
                </div>
            </div>
        </div>

    </div>
    <br><br>
    <div class="fieldcontain ${hasErrors(bean: borrowInstance, field: 'status', 'error')} ">
        <label for="status">
            <g:message code="borrow.status.label" default="Status" />
        </label>
            <g:checkBox name="status" value="false" />
        <label>Tick for not returned</label>
        </div>
    </div>
</div>
<p> Between <input type="text" id="datepicker"> </p>
