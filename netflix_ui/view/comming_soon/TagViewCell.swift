//
//  TagViewCell.swift
//  netflix_ui
//
//  Created by ATIAdmin on 13/06/2022.
//

import UIKit

class TagViewCell: UICollectionViewCell {
    static let indentify = "TagViewCell"
    @IBOutlet weak var labelText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func setDataLabel(label:String){
        labelText.text = label
    }
}
