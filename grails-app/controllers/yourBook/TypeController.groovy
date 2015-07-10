package yourBook


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Type.list(params), model: [typeInstanceCount: Type.count()]
    }

    def show(Type typeInstance) {
        respond typeInstance
    }

    def create() {
        respond new Type(params)
    }

    @Transactional
    def save(Type typeInstance) {
        if (typeInstance == null) {
            notFound()
            return
        }

        if (typeInstance.hasErrors()) {
            respond typeInstance.errors, view: 'create'
            return
        }

        typeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'type.label', default: 'Type'), typeInstance.id])
                redirect typeInstance
            }
            '*' { respond typeInstance, [status: CREATED] }
        }
    }

    def edit(Type typeInstance) {
        respond typeInstance
    }

    @Transactional
    def update(Type typeInstance) {
        if (typeInstance == null) {
            notFound()
            return
        }

        if (typeInstance.hasErrors()) {
            respond typeInstance.errors, view: 'edit'
            return
        }

        typeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Type.label', default: 'Type'), typeInstance.id])
                redirect typeInstance
            }
            '*' { respond typeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Type typeInstance) {

        if (typeInstance == null) {
            notFound()
            return
        }

        typeInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Type.label', default: 'Type'), typeInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'type.label', default: 'Type'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
