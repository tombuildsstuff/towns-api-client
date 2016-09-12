import Foundation

public class TownsService {
    
    private let serviceBaseUrl: String
    
    public init(serviceBaseUrl: String) {
        self.serviceBaseUrl = serviceBaseUrl
    }
    
    public func getAll(successful: @escaping (Towns) -> (), failure: @escaping (Error) -> ()) {
        let endpoint = "\(self.serviceBaseUrl)/towns/all"
        self.getTownsJson(endpoint: endpoint, done: {
            (data: Data) -> () in
            let towns = self.parseTowns(data: data)
            successful(towns)
        }, error: failure)
    }
    
    private func getTownsJson(endpoint: String, done: @escaping (Data) -> (), error: @escaping (Error) -> ()) {
        let url = URL(string: endpoint)!
        let request = URLRequest(url: url)
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request, completionHandler: {(data, response, err) in
            
            if let anError = err {
                error(anError)
                return
            }
            
            done(data!)
            
        })
        
        task.resume()
    }
    
    private func parseTowns(data: Data) -> Towns {
        let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [[String: AnyObject]]
        return Towns(dictionary: json)
    }

}
