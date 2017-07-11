//
//  MessageListRemoveMessageListDelegate.swift
//  Message
//
//  Created by Sergio David Bravo Talero on 7/11/17.
//  Copyright © 2017 sergiobtalero. All rights reserved.
//

import Foundation
import UIKit

extension MasterViewController: RemoveMessageDelegate {
    func removeMessageButtonTapped(message: Message) {
        guard let row = messages.index(of: message) else { return }
        
        let alertController = UIAlertController(title: "Attention", message: "Do you want to proceed with deleting this message?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
            let indexPath = IndexPath(row: row, section: 0)
            
            self.messages.remove(at: row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            self.delegate?.updateUIToCleanMessage()
        })
        alertController.addAction(deleteAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

