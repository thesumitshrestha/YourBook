package yourBook

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
@Transactional(readOnly = false)
class ReserveController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Reserve.list(params), model: [reserveInstanceCount: Reserve.count()]

    }
    def mail(){
        println"params.mId"+params.mId
        println "Bookid"+params.BId
        def sendingMail = Member.findById(params.mId)
        def email = sendingMail.email
        def firstname = sendingMail.firstName
        def lastname = sendingMail.lastName
        def bookId = Book.findById(params.BId)
        def bookName = bookId.book_title
        sendMail {
            to email
            subject "Reserve Book Notification"
            body "Hello "+firstname+" "+lastname+ ", \n \tPlease come and collect book "+ bookName+ " that you had reserved. \n\nThanks\n DWIT Library"
        }
        flash.message = "Mail Sent to "+email+"( "+firstname+" "+lastname+ ") for "+bookName+ " book"
        redirect(action: 'index')
    }
    def show(Reserve reserveInstance) {
        respond reserveInstance
    }

    def create() {
        println "this is reserversasa"
        def bookId=params.id
        def bookName = params.bookName
        println bookId + bookName
        render(view:"create", model: [bookId:bookId, bookName:bookName])
    }

    @Transactional
    def save() {
        println "Hey"

        def reserve=new Reserve();
        reserve.book = Book.findById(params.bookId)
        reserve.member = Member.findById(params.memberId)
        reserve.save(flush: true)
    }
    def reserve() {
        println "Hey"

        def reserve=new Reserve();
        reserve.book = Book.findById(params.bookId)
        reserve.member = Member.findById(params.memberId)
        reserve.save(flush: true)
        redirect(action: 'index')
        flash.message="The book "+reserve.book+ ( " has been reserved by ")+reserve.member
    }


    def edit(Reserve reserveInstance) {
        respond reserveInstance
    }

    @Transactional
    def update(Reserve reserveInstance) {
        if (reserveInstance == null) {
            notFound()
            return
        }

        if (reserveInstance.hasErrors()) {
            respond reserveInstance.errors, view: 'edit'
            return
        }

        reserveInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Reserve.label', default: 'Reserve'), reserveInstance.id])
                redirect reserveInstance
            }
            '*' { respond reserveInstance, [status: OK] }
        }
    }

    def delete(Reserve reserveInstance) {
        println"In delete"
        reserveInstance = Reserve.findById(params.rId)
        if (reserveInstance == null) {
            notFound()
            return
        }
        reserveInstance.delete flush: true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Reserve.label', default: 'Reserve'), reserveInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    def deleteReserve(Reserve reserveInstance) {
        println"In delete"
        reserveInstance = Reserve.findById(params.rid)
        println"Id="+reserveInstance
        if (reserveInstance == null) {
            notFound()
            return
        }
        reserveInstance.delete flush: true
        flash.message = "Deleted"
        redirect(action: 'index')
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'reserve.label', default: 'Reserve'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
