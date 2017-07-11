//
//  MessageListUITableViewDelegate.swift
//  Message
//
//  Created by Sergio David Bravo Talero on 7/11/17.
//  Copyright © 2017 sergiobtalero. All rights reserved.
//

import Foundation
import UIKit

extension MasterViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let message = messages[indexPath.row]
        
        
        performSegue(withIdentifier: Segues.showDetail.rawValue, sender: nil)
        update(message: message)
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? MessageListTableViewCell {
            cell.message = messages[indexPath.row]
        }
    }
}
