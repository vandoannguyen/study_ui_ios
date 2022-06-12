//
//  DetailItemTableViewCell.swift
//  netflix_ui
//
//  Created by Nguyen Van Doan OS  on 12/06/2022.
//

import UIKit

class DetailItemTableViewCell: UIView {

    @IBOutlet weak var imgFilm: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgFilm.image = UIImage(named: "header_poster")
    }
}
