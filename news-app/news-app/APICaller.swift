//
//  APICaller.swift
//  news-app
//
//  Created by hungvn on 3/21/24.
//

import Foundation

// Define your model structure
struct Model {
    var title: String
    var link: String
    var pubDate: String
}

class APICaller {
    static let shared = APICaller() // Singleton instance
    
    func fetchData(completion: @escaping (Result<[Model], Error>) -> Void) {
        // RSS feed URL
        let rssURLString = "https://vnexpress.net/rss/tin-moi-nhat.rss"// truyen param
        
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

// Create a custom XMLParserDelegate to handle RSS parsing
class RSSParserDelegate: NSObject, XMLParserDelegate {
    var models: [Model] = []
    var currentElement: String = ""
    var currentTitle: String = ""
    var currentLink: String = ""
    var currentPubDate: String = ""
  
    
    // Called when an element is found in the XML
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if currentElement == "item" {
            currentTitle = ""
            currentLink = ""
            currentPubDate = ""
        }
        
    }
    
    // Called when characters are found in the XML
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case "title":
            currentTitle += string
        case "link":
            currentLink += string
        case "pubDate":
            currentPubDate += string
        default:
            break
        }
    }
    
    // Called when an element ends in the XML
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item"{
            let model = Model(title: currentTitle, link: currentLink, pubDate: currentPubDate)
            models.append(model)
            currentTitle = ""
            currentLink = ""
            currentPubDate = ""
            
        }
    }
}



