//
//  ItemTopSearchTableViewCell.swift
//  netflix_ui
//
//  Created by ATIAdmin on 13/06/2022.
//

import UIKit

class ItemTopSearchTableViewCell: UITableViewCell {
    @IBOutlet weak var labDescription: UILabel!
    @IBOutlet weak var labFilmName: UILabel!
    @IBOutlet weak var imgFilm: UIImageView!
    static let indentify = "ItemTopSearchTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        imgFilm.layer.masksToBounds = true
        imgFilm.layer.cornerRadius = 8
        imgFilm.frame = CGRect(x: 0, y: 0, width: bounds.width/3, height: 80)
        reloadInputViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
