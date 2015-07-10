package yourBook

class User {
    String userName
    String password
    String role
    static constraints = {
       password(nullable: false, blank: false)
       userName(nullable: false,blank: false)
       role(inList: ['Admin','Student'])
    }
    String toString(){
        return userName
    }
    static hasMany = [member:Member]
}
