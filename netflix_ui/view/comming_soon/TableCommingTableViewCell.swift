//
//  TableCommingTableViewCell.swift
//  netflix_ui
//
//  Created by Nguyen Van Doan OS  on 12/06/2022.
//

import UIKit

class TableCommingTableViewCell: UITableViewCell {
    @IBOutlet weak var lbMnth: UILabel!
    @IBOutlet weak var lbDay: UILabel!
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var collectionTag: UICollectionView!
    var listTag = ["Quickly", "comendly", "Goofly","Quickly", "comendly", "Goofly","Quickly", "comendly", "Goofly"]
    
    static let indentify = "TableCommingTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionTag.delegate = self
        collectionTag.dataSource = self
        collectionTag.register(UINib(nibName: "TagViewCell", bundle: nil), forCellWithReuseIdentifier: TagViewCell.indentify)
        imgPoster  .layer.masksToBounds = true
        imgPoster.layer.shadowRadius = 10
        imgPoster.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension TableCommingTableViewCell:UICollectionViewDataSource, UICollectionViewDelegate{
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listTag.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionTag.dequeueReusableCell(withReuseIdentifier: TagViewCell.indentify, for: indexPath) as! TagViewCell
        cell.setDataLabel(label:listTag[indexPath.row])
        return cell
    }
}

