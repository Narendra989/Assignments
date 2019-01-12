//
//  CommentCell.swift
//  Assignment
//
//  Created by Narendra Satpute on 12/01/19.
//  Copyright © 2019 Digi. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var commentLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpData(message: Comment){
        if let msg = message.message {
            commentLbl.text = msg
        }
        
    }
    
}
