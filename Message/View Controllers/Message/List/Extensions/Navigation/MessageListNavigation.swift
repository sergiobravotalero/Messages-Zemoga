//
//  MessageListNavigation.swift
//  Message
//
//  Created by Sergio David Bravo Talero on 7/11/17.
//  Copyright © 2017 sergiobtalero. All rights reserved.
//

import Foundation
import UIKit

extension MasterViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
            passSelectedMessage(toController: controller, message: messages[indexPath.row])
        }
    }
}
