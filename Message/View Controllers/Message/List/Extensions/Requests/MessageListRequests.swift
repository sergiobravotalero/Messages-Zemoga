//
//  MessageListRequests.swift
//  Message
//
//  Created by Sergio David Bravo Talero on 7/11/17.
//  Copyright © 2017 sergiobtalero. All rights reserved.
//

import Foundation

extension MasterViewController {
    func fetchData() {
        guard let retrievedMessages = UserDefaultsController().retrieveMessages(), !retrievedMessages.isEmpty else {
            reloadData()
            return
        }
        
        messages = retrievedMessages
    }
    
    func reloadData() {
        Requester().getListOfMessages(callback: { (needsUpdate) in
            if !needsUpdate {
                return
            }
            
            if let reloadedMessages = UserDefaultsController().retrieveMessages(), !reloadedMessages.isEmpty {
                self.messages = reloadedMessages
                self.tableView.reloadData()
            }
        })
    }
    
    func update(message: Message) {
        if !message.unread! {
            return
        }
        
        guard let index = messages.index(of: message) else { return }
        messages[index].unread = false
        UserDefaultsController().save(messages: messages)
    }
}
