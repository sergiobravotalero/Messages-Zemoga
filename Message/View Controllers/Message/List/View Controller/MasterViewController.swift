//
//  MasterViewController.swift
//  Message
//
//  Created by Sergio David Bravo Talero on 7/10/17.
//  Copyright © 2017 sergiobtalero. All rights reserved.
//

import UIKit

enum CellIdentifiers: String {
    case messageCell = "MessageListTableViewCell"
}

enum Segues: String {
    case showDetail = "showDetail"
}

protocol CleanMessageSelection: class {
    func updateUIToCleanMessage()
}

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var messages = [Message]()
    var delegate: CleanMessageSelection?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupEmptyState()
        prepareView()
    }

    // MARK: - Methods
    private func prepareView() {
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        // Table View
        tableView.backgroundColor = UIColor.signatureBlack
        
        tableView.register(
            UINib(nibName: CellIdentifiers.messageCell.rawValue, bundle: nil),
            forCellReuseIdentifier: CellIdentifiers.messageCell.rawValue)
        
        // Navigation Controller
        navigationController?.navigationBar.barTintColor = UIColor.signatureBlack
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        // Toolbar
        navigationController?.toolbar.barTintColor = UIColor.signatureBlack
    }
    
    func passSelectedMessage(toController: DetailViewController, message: Message) {
        delegate = toController
        
        toController.message = message
        toController.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        toController.navigationItem.leftItemsSupplementBackButton = true
        toController.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
    }
    
    // MARK: - IBAction
    @IBAction func dismissAllButtonTapped(_ sender: Any) {
        guard !messages.isEmpty else { return }
        
        let count = messages.count - 1
        
        messages.removeAll()
        delegate?.updateUIToCleanMessage()
        
        tableView.beginUpdates()
        for index in 0...count {
            tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .fade)
        }
        tableView.endUpdates()
    }
}













