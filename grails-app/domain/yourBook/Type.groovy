package yourBook

class Type {

    String type
    static constraints = {
        type(nullable: false, blank: false)
    }
    static hasMany = [member:Member]
    String toString(){
        return type
    }
}
