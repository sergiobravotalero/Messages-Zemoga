//
//  Message.swift
//  Messages
//
//  Created by Sergio David Bravo Talero on 7/10/17.
//  Copyright © 2017 sergiobtalero. All rights reserved.
//

import Foundation
import ObjectMapper

class Message: NSObject, Mappable {
    var title: String?
    var unread: Bool?
    var date: String?
    var message: String?
    
    required init?(map: Map){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let title = aDecoder.decodeObject(forKey: MessageKeys.title.rawValue) as? String,
            let unread = aDecoder.decodeObject(forKey: MessageKeys.unread.rawValue) as? Bool,
            let date = aDecoder.decodeObject(forKey: MessageKeys.date.rawValue) as? String,
            let message = aDecoder.decodeObject(forKey: MessageKeys.message.rawValue) as? String {
            self.title = title
            self.unread = unread
            self.date = date
            self.message = message
        }
    }
    
    // MARK: - Methods
    
    func mapping(map: Map) {
        title <- map["title"]
        unread <- map["unread"]
        date <- map["date"]
        message <- map["message"]
    }
}

extension Message: Comparable {
    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.title == rhs.title && lhs.date == rhs.date && lhs.message == lhs.message
    }
    
    static func < (lhs:Message, rhs: Message) -> Bool {
        guard let lhsTitle = lhs.title, let rhsTitle = rhs.title else {
            return false
        }
        
        return lhsTitle < rhsTitle
    }
}

extension Message: NSCoding {
    enum MessageKeys: String {
        case title = "title"
        case unread = "unread"
        case date = "date"
        case message = "message"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.title, forKey: MessageKeys.title.rawValue)
        aCoder.encode(self.unread, forKey: MessageKeys.unread.rawValue)
        aCoder.encode(self.date, forKey: MessageKeys.date.rawValue)
        aCoder.encode(self.message, forKey: MessageKeys.message.rawValue)
    }
    
    
}
