package yourBook

class Category {
    String name
    static constraints = {
        name(nullable: false, blank:false)
    }
    static hasMany = [book:Book]
    String toString(){
        return name
    }
}
