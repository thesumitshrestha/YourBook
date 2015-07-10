package yourBook

class Book {
    String book_title
    String author
    String book_pub
    String publisher_name
    Integer noofBooks
    Integer isbn
    Integer copyright_year
    static constraints = {
        book_title(nullable: false, blank: false)
        author(nullable: false, blank: false)
        book_pub(nullable: false, blank: false)
        publisher_name(nullable: true, blank: true)
        isbn(nullable: false, blank:false)
        copyright_year(nullable: false, blank:false)
        noofBooks(nullable: false)
    }
    static belongsTo = [category:Category]
    static hasMany = [borrow:Borrow]

    String toString(){
        return book_title
    }

}

