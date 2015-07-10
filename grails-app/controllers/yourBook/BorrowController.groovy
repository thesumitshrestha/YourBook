package yourBook


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class BorrowController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Borrow.list(params), model: [borrowInstanceCount: Borrow.count()]
    }

    def show(Borrow borrowInstance) {
        respond borrowInstance
    }

    def create() {
        def bookId=params.bookId
        def bookName=params.bookName
        model:[bookId:bookId,bookName:bookName]
    }

  /*  def save() {
        def borrow = new Borrow()
        borrow.book = Book.findById(params.bookId)
        borrow.member=Member.findByRollNumber(params.stdRoll)
        borrow.date_borrow=params.date_borrow
        borrow.due_date=params.due_date
        borrow.returnedDate=params.returnedDate
        borrow.status=params.status
        borrow.save(flush: true)
        redirect(action: 'index')
        println "Yo"
    }*/
    def borrow(Borrow borrow){
 /*       def bookId=Integer.parseInt(params.bookId)
        def memberId=Integer.parseInt(params.stdRoll)*/
        println("MF"+params.status)
        borrow.date_borrow=params.date_borrow
        borrow.due_date=params.due_date
        borrow.book = Book.findById(params.bookId)
        borrow.member= Member.findByRollNumber(params.stdRoll)
        borrow.returnedDate=params.returnedDate
        borrow.status=params.status
        println"Here"+borrow
        if(borrow.save(flush: true, failOnError: true)){
            redirect(action: 'index')
        }
        else {
            redirect(action: 'create')
        }
    }

    def edit() {
        def bookName =params.bookName
        def rollNo = params.memberId
        def borrowInstance=Borrow.findById(params.borrowId)
        println "Borrow "+borrowInstance+" aaa "
        model:[borrowInstance:borrowInstance,bookName: bookName,bookId: borrowInstance.bookId,rollNo:rollNo]
    }

    @Transactional
    def update(Borrow borrowInstance) {
        if (borrowInstance == null) {
            notFound()
            return
        }

        if (borrowInstance.hasErrors()) {
            respond borrowInstance.errors, view: 'edit'
            return
        }

        borrowInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Borrow.label', default: 'Borrow'), borrowInstance.id])
                redirect borrowInstance
            }
            '*' { respond borrowInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Borrow borrowInstance) {

        if (borrowInstance == null) {
            notFound()
            return
        }

        borrowInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Borrow.label', default: 'Borrow'), borrowInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'borrow.label', default: 'Borrow'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
