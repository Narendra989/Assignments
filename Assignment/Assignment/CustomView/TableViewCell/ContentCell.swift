//
//  ContentCell.swift
//  Assignment
//
//  Created by Narendra Satpute on 12/01/19.
//  Copyright © 2019 Digi. All rights reserved.
//

import UIKit
import AlamofireImage

class ContentCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var commentCount: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var contentImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       self.selectionStyle = .none
        containerView.layer.cornerRadius = 5.0
        contentImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        contentImage.clipsToBounds = true
        contentImage.layer.cornerRadius = 5.0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func setupData(content: Content){
        
        if let imgUrl = content.image {
            
            if let url = URL(string:imgUrl){
                contentImage.af_setImage(withURL: url)
            }
        }
        if let msg = content.message {
            messageLbl.text = msg
        }
        if let comment = content.comment {
            commentCount.text = "\(comment.count)"
        }
        
        
    }
    
}
