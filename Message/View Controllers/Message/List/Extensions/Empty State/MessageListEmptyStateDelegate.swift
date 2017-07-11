//
//  MessageListEmptyStateDelegate.swift
//  Message
//
//  Created by Sergio David Bravo Talero on 7/11/17.
//  Copyright © 2017 sergiobtalero. All rights reserved.
//

import Foundation
import DZNEmptyDataSet

extension MasterViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    func setupEmptyState() {
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        
        tableView.tableFooterView = UIView()
    }
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "No messages to show"
        let attributes = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 18.0), NSForegroundColorAttributeName: UIColor.white]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
}
