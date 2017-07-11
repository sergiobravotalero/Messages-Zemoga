//
//  Requester.swift
//  Messages
//
//  Created by Sergio David Bravo Talero on 7/10/17.
//  Copyright © 2017 sergiobtalero. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

enum URLS: String {
    case Messages = "https://api.myjson.com/bins/54tf5"
    
    func getURL() -> URL? {
        return URL(string: self.rawValue)
    }
}

class Requester {
    
    func getListOfMessages(callback: @escaping(_ completion: Bool) -> ()) {
        guard let url = URLS.Messages.getURL() else {
            callback(false)
            return
        }
        
        Alamofire.request(url).responseArray(completionHandler: { (response: DataResponse<[Message]>) in
            
            var messagesArray = [Message]()
            guard let retrievedMessagesArray = response.result.value else { return }

            for message in retrievedMessagesArray {
                print(message.title ?? "No name parsed")
                messagesArray.append(message)
            }
            
            UserDefaultsController().save(messages: messagesArray)
            callback(true)
        })
    }
    
    
}





