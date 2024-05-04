//
//  CollectionCellExt.swift
//  API Call
//
//  Created by Mayank Barnwal on 04/05/24.
//

import UIKit


extension UICollectionViewCell{
    class func getCellIdentifier() -> String{
        return String(describing : self)
    }
}
