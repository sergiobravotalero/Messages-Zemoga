//
//  DetailViewController.swift
//  Message
//
//  Created by Sergio David Bravo Talero on 7/10/17.
//  Copyright © 2017 sergiobtalero. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var message: Message? {
        didSet {
            configureView()
        }
    }
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var messageContentLabel: UILabel!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        configureView()
    }

    // MARK: - Method
    func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor.signatureBlack
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    func configureView() {
        guard let detailDescriptionLabel = detailDescriptionLabel, let messageTextView = messageTextView, let messageContentLabel = messageContentLabel else {
            return
        }
        
        if let message = message {
            detailDescriptionLabel.isHidden = true
            messageTextView.isHidden = false
            messageContentLabel.isHidden = false
            
            messageContentLabel.text = message.title
            messageTextView.text = message.message
        } else {
            detailDescriptionLabel.isHidden = false
            messageTextView.isHidden = true
            messageContentLabel.isHidden = true
        }
    }
}

extension DetailViewController: CleanMessageSelection {
    func updateUIToCleanMessage() {
        message = nil
    }
}

