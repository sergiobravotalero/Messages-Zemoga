//
//  MessageListTableViewCell.swift
//  Messages
//
//  Created by Sergio David Bravo Talero on 7/10/17.
//  Copyright © 2017 sergiobtalero. All rights reserved.
//

import UIKit

protocol RemoveMessageDelegate: class {
    func removeMessageButtonTapped(message: Message)
}

class MessageListTableViewCell: UITableViewCell {
    
    var message: Message? {
        didSet {
            configureCell()
        }
    }
    
    var delegate: RemoveMessageDelegate?

    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    // MARK: - Override Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Methods
    func configureCell() {
        let customView = UIView()
        customView.backgroundColor = UIColor.signatureSelectedBlack
        selectedBackgroundView = customView
        contentView.backgroundColor = UIColor.signatureBlack
        
        guard let title = message?.title, let messageContent = message?.message, let status = message?.unread  else { return }
        
        titleLabel.text = title
        messageLabel.text = messageContent
        statusImage.isHidden = !status
    }
    
    // MARK: - IBAction
    @IBAction func dismissMessageTapped(_ sender: Any) {
        guard let message = message else { return }
        delegate?.removeMessageButtonTapped(message: message)
    }
}
