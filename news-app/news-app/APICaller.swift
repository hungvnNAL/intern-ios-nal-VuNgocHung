import Foundation

// Define your model structure
struct Model {
    var title: String
    var link: String
    var pubDate: String
    var imageUrl: URL // Sử dụng kiểu dữ liệu URL cho đường dẫn hình ảnh
    
    init(title: String, link: String, pubDate: String, imageUrl: URL) {
        self.title = title
        self.link = link
        self.pubDate = pubDate
        self.imageUrl = imageUrl
    }
}

class APICaller {
    static let shared = APICaller() // Singleton instance
    
    func fetchData(completion: @escaping (Result<[Model], Error>) -> Void) {
        // RSS feed URL
        let rssURLString = "https://vnexpress.net/rss/tin-moi-nhat.rss"
        
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
                print(parser)
            } else {
                completion(.failure(NSError(domain: "ParsingError", code: 0, userInfo: nil)))
            }
        }
        
        // Start the data task
        task.resume()
    }
}

class RSSParserDelegate: NSObject, XMLParserDelegate {
    var models: [Model] = []
    var currentElement: String = ""
    var currentTitle: String = ""
    var currentLink: String = ""
    var currentPubDate: String = ""
    var currentImageUrl: URL?
    var isParsingDescription: Bool = false
    
    // Called when an element is found in the XML
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if currentElement == "item" {
            currentTitle = ""
            currentLink = ""
            currentPubDate = ""
            currentImageUrl = nil
            isParsingDescription = false
        } else if currentElement == "description" {
            isParsingDescription = true
        }
    }
    
    // Called when characters are found in the XML
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if isParsingDescription {
            // Extract image URL from description
            if let imageUrl = extractImageUrl(from: string) {
                currentImageUrl = imageUrl
            }
        } else {
            switch currentElement {
            case "title":
                currentTitle += string.trimmingCharacters(in: .whitespacesAndNewlines)
            case "link":
                currentLink += string.trimmingCharacters(in: .whitespacesAndNewlines)
            case "pubDate":
                currentPubDate += string.trimmingCharacters(in: .whitespacesAndNewlines)
            default:
                break
            }
        }
    }
    
    // Called when an element ends in the XML
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            // Create Model object with image URL only
            if let imageUrl = currentImageUrl {
                let model = Model(title: currentTitle, link: currentLink, pubDate: currentPubDate, imageUrl: imageUrl)
                models.append(model)
            }
            currentTitle = ""
            currentLink = ""
            currentPubDate = ""
            currentImageUrl = nil
            isParsingDescription = false
        }
    }
    
    // Function to extract image URL from HTML description
    private func extractImageUrl(from description: String) -> URL? {
        let pattern = "src=\"(.*?)\""
        if let range = description.range(of: pattern, options: .regularExpression) {
            let imageUrlString = String(description[range].dropFirst(5).dropLast(1))
            return URL(string: imageUrlString)
        }
        return nil
    }
}
