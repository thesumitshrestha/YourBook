package yourBook

class Member {
    String firstName
    String lastName
    Integer rollNumber
    String gender
    String address
    Integer contact
    Integer batch
    String email
    static constraints = {
        rollNumber(nullable: false, blank:false)
        firstName(nullable: false, blank: false)
        lastName(nullable: false, blank:false)
        gender(inList: ['Male', 'Female', 'Other'])
        address(nullable: false, blank: false)
        contact(nullable: false, blank: false)
        batch(nullable: false, blank: false)
        email(nullable: false, blank:false,unique: true)
    }
    static belongsTo = [type:Type,user:User]
    static hasMany = [borrow:Borrow]
    String toString(){
        return rollNumber+"_"+firstName+" "+lastName
    }
}
