//
//  XMLParser.swift
//  news-app
//
//  Created by hungvn on 3/26/24.
//

import Foundation

class RSSParserDelegate: NSObject, XMLParserDelegate {
    var models: [NewsItem] = []
    var currentElement: String = ""
    var currentTitle: String = ""
    var currentLink: String = ""
    var currentPubDate: String = ""
    var currentImageUrl: URL?
    var isParsingDescription: Bool = false
    
    // Called when an element is found in the XML
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        isParsingDescription = false
        if currentElement == "item" {
            currentTitle = ""
            currentLink = ""
            currentPubDate = ""
            currentImageUrl = nil
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
                let model = NewsItem(title: currentTitle, link: currentLink, pubDate: currentPubDate, imageUrl: imageUrl)
                models.append(model)
            }
            currentTitle = ""
            currentLink = ""
            currentPubDate = ""
            currentImageUrl = nil
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
