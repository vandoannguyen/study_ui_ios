//
//  HomeTableViewCell.swift
//  netflix_ui
//
//  Created by Nguyen Van Doan OS  on 12/06/2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    static let indentify = "HomeTableViewCell" 
    @IBOutlet weak var collectionFilms: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configCollection()
    }
    func configCollection(){
        collectionFilms.delegate = self
        collectionFilms.dataSource = self
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        layout.itemSize = CGSize(width: 100, height: 130)
        layout.scrollDirection = .horizontal
        collectionFilms.setCollectionViewLayout(layout, animated: true)
        collectionFilms.register(UINib(nibName: "ItemFilmViewCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ItemFilmViewCellCollectionViewCell.indentify)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
extension HomeTableViewCell:UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionFilms.dequeueReusableCell(withReuseIdentifier: ItemFilmViewCellCollectionViewCell.indentify, for: indexPath) as! ItemFilmViewCellCollectionViewCell
//        cell.backgroundColor = .systemPink
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
