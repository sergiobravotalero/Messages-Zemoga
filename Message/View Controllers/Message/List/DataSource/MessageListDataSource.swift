//
//  MessageListDataSource.swift
//  Message
//
//  Created by Sergio David Bravo Talero on 7/11/17.
//  Copyright © 2017 sergiobtalero. All rights reserved.
//

import Foundation
import UIKit

extension MasterViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.messageCell.rawValue, for: indexPath) as! MessageListTableViewCell
        cell.message = messages[indexPath.row]
        cell.delegate = self
        return cell
    }
}
