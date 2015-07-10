package yourBook

class Reserve {


    static constraints = {
    }
    static belongsTo = [book:Book, member:Member]

}
