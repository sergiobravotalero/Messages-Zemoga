//
//  UserDefaults.swift
//  Messages
//
//  Created by Sergio David Bravo Talero on 7/10/17.
//  Copyright © 2017 sergiobtalero. All rights reserved.
//

import Foundation

enum UserDefaultsKeys: String {
    case messagesList = "messagesList"
}

class UserDefaultsController{
    let defaults = UserDefaults.standard
    
    func retrieveMessages() -> [Message]? {
        var messages = [Message]()
        guard let storedValues = defaults.object(forKey: UserDefaultsKeys.messagesList.rawValue) as? [Data] else {
            return nil
        }
        
        for data in storedValues {
            guard let message = NSKeyedUnarchiver.unarchiveObject(with: data) as? Message else { continue }
            
            messages.append(message)
        }
        
        return messages
    }
    
    func save(messages: [Message]) {
        var encodedMessages = [Data]()
        
        for message in messages {
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: message)
            encodedMessages.append(encodedData)
        }
        
        defaults.set(encodedMessages, forKey: UserDefaultsKeys.messagesList.rawValue)
        defaults.synchronize()
    }
    
}
