package yourBook

class Borrow {
    Date tillDate (){
        return new Date()
    }
    Date date_borrow = tillDate()
    Date due_date = tillDate()
    Date returnedDate = tillDate()
    Boolean status = Boolean.FALSE
    static constraints = {
        date_borrow(nullable: false, blank:false)
        due_date(nullable: false, blank:false)
    }
    static belongsTo = [book:Book, member:Member]
    static mapping = {
        status defaultValue: "false"
    }
}
