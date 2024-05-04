//
//  ListCollectionViewCell.swift
//  API Call
//
//  Created by Mayank Barnwal on 04/05/24.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    var user:GitUserModalElement!{
        didSet{
            profileImageView.setImageProfilePic(imageUrlString: user.avatarURL)
            usernameLabel.text = user.login
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        dropShadow(opacity: 0.4, radius: 10.0)
    }

}
