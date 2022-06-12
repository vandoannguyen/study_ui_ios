//
//  ItemFilmViewCellCollectionViewCell.swift
//  netflix_ui
//
//  Created by Nguyen Van Doan OS  on 12/06/2022.
//

import UIKit

class ItemFilmViewCellCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgFilm: UIImageView!
    static let indentify = "ItemFilmViewCellCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
        imgFilm.image = UIImage(named: "header_poster")
        layer.cornerRadius = 5
        layer.masksToBounds = true
        // Initialization code
    }

}
