import Foundation




class APICaller {

    static let shared = APICaller()
    
    var indexLink: IndexPath?
    
    func fetchData(completion: @escaping (Result<[NewsItem], Error>) -> Void) {
        let rssURLString = "https://vnexpress.net/rss/\(categories[indexLink?.row ?? 0].link).rss"
        
        // Create a URL object from the URL string
        guard let rssURL = URL(string: rssURLString) else {
            completion(.failure(NSError(domain: "InvalidURL", code: 0, userInfo: nil)))
            return
        }
        
        // Create a URLSession to fetch the data
        let session = URLSession.shared
        
        // Create a data task to fetch the RSS feed data
        let task = session.dataTask(with: rssURL) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Check if data is available
            guard let data = data else {
                completion(.failure(NSError(domain: "NoData", code: 0, userInfo: nil)))
                return
            }
            
            // Create an XMLParser object to parse the RSS feed data
            let parser = XMLParser(data: data)
            let rssParserDelegate = RSSParserDelegate()
            parser.delegate = rssParserDelegate
            
            // Start parsing the data
            if parser.parse() {
                completion(.success(rssParserDelegate.models))
            } else {
                completion(.failure(NSError(domain: "ParsingError", code: 0, userInfo: nil)))
            }
        }
        
        // Start the data task
        task.resume()
    }
    
}
