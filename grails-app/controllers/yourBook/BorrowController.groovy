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
    def search()
    {
        def borrowList = Borrow.findAllByMember(Member.findByRollNumber(params.query))
        render(view: 'index', model: [borrowInstanceList: borrowList,borrowInstanceCount: borrowList.size()])
    }
    def create() {
        def bookId=params.bookId
        def bookInstance=Book.findById(bookId)
        render view: 'create', model:[bookInstance:bookInstance,action: 'createBorrow']
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
        def book=Book.findById(params.bookId)
        println "Before"+book.noofBooks
        if(book.noofBooks>0){
            book.noofBooks=book.noofBooks-1
        }
        book.save(flush: true, failOnError: true)
        println "After Decreasing"+book.noofBooks
        borrow.member= Member.findByRollNumber(params.stdRoll)
        borrow.returnedDate=params.returnedDate
        borrow.status=params.status

        if(borrow.save(flush: true, failOnError: true)){
            flash.message =  "A book has been borrowed by"+ " "+ borrow.member
            redirect(action: 'index')
        }
        else {
            flash.message = "Oops! Something went wrong. Try again"
            redirect(action: 'create')
        }
    }

    def edit() {
        println "Borrow id is"+params.borrowId
        def borrowInstance=Borrow.findById(params.borrowId)
        render view:'edit',model:[borrowInstance:borrowInstance,action:'edit']

    }

    @Transactional
    def update(Borrow borrowInstance) {
        if(borrowInstance.returnedDate&&borrowInstance.status==false){
            def book=Book.findById(params.bookId)
            book.noofBooks=book.noofBooks+1
            book.save(flush: true, failOnError: true)
        }
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
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Borrow.label', default: 'Borrow'), borrowInstance.book])
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
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Borrow.label', default: 'Borrow'), borrowInstance.book])
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
