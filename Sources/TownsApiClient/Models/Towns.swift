public class Towns {
    public let towns: [Town]
    
    init(dictionary townsDictionary: [[String: AnyObject]]) {
        let towns = townsDictionary.map { (dictionary: [String : AnyObject]) -> Town in
            return Town(dictionary: dictionary)
        }
        self.towns = towns
    }
}
