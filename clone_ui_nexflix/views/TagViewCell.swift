//
//  TagViewCell.swift
//  clone_ui_nexflix
//
//  Created by ATIAdmin on 10/06/2022.
//

import UIKit

class TagViewCell: UICollectionViewCell {
    static let indentify  = "TagViewCell"
    var tagName:String = ""
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
