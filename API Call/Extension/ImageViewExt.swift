//
//  ImageViewExt.swift
//  API Call
//
//  Created by Mayank Barnwal on 04/05/24.
//

import UIKit
import SDWebImage

extension UIImageView {
    func setImageProfilePic(imageUrlString:String){
        if let imageUrl = URL(string: imageUrlString){
            sd_setImage(with:imageUrl, placeholderImage: UIImage.init(named: "profile_pic"), options: [.delayPlaceholder,.progressiveLoad,.retryFailed])
        }
        else{
            image = UIImage.init(named: "profile_pic")
        }
        contentMode = .scaleAspectFill
        isUserInteractionEnabled = true
    }
}
