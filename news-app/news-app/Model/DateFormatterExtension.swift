//
//  DateFormatterExtension.swift
//  news-app
//
//  Created by hungvn on 3/27/24.
//

import Foundation
extension DateFormatter {
    
    func convertStringDateFormat(dateString: String) -> String? {
        self.dateFormat = "EEE, dd MMM yyyy HH:mm:ss Z"
        guard let date = self.date(from: dateString) else {
            return nil
        }
        let time = Date().timeIntervalSince(date)
        switch (time/(3600)) {
        case 1...24 :
            return "\(Int(time/3600)) tiếng trước"
        case 0...1 :
            return "\(Int(time/60)) phút trước"
        default:
            self.dateFormat = "dd/MM/yyyy"
            return self.string(from: date)
        }
    }
    
}
