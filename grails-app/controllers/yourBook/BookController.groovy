package yourBook

class BookController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Book.list(params), model: [bookInstanceCount: Book.count()]
    }

    def search()
    {
        def bookList = Book.createCriteria().list(params){
            if(params.query){
                ilike("book_title","%${params.query}%")
            }
        }
        render(view: 'index', model: [bookInstanceList:bookList])
    }
    def show(Book bookInstance) {
        respond bookInstance
    }

    def create() {
        respond new Book(params)
    }

    def save(Book bookInstance) {
        def book = Book.findById(bookInstance.id)
        println"paras"+book
        if (bookInstance == null) {
            notFound()
            return
        }

        if (bookInstance.hasErrors()) {
            respond bookInstance.errors, view: 'create'
            return
        }

        bookInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = "New Book Created"
                redirect bookInstance
            }
            '*' { respond bookInstance, [status: CREATED] }
        }
        flash.message = "New Book Added"
    }

    def test(){
        render view: 'test'
    }
    def edit(Book bookInstance) {
        respond bookInstance
    }

    def update(Book bookInstance) {
        if (bookInstance == null) {
            notFound()
            return
        }

        if (bookInstance.hasErrors()) {
            respond bookInstance.errors, view: 'edit'
            return
        }
        bookInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Book.label', default: 'Book'), bookInstance.book_title])
                redirect bookInstance
            }
            '*' { respond bookInstance, [status: OK] }
        }
    }

    def delete(Book bookInstance) {
        bookInstance = Book.findById(params.id)
        if (bookInstance == null) {
            notFound()
            return
        }

        bookInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Book.label', default: 'Book'), bookInstance.book_title])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'book.label', default: 'Book'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
