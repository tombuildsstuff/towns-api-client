public class Town {

    public let name: String
    public let country: String
    
    init(dictionary: [String: AnyObject]) {
        self.name = dictionary["name"] as! String
        self.country = dictionary["country"] as! String
    }

}
