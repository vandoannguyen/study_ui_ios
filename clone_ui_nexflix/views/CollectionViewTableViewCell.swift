//
//  CollectionViewTableViewCell.swift
//  clone_ui_nexflix
//
//  Created by ATIAdmin on 09/06/2022.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    static let indentify = "CollectionViewTableViewCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .blue
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    
    }
    private let collectionView: UICollectionView = {
                let layout = UICollectionViewFlowLayout()
                layout.scrollDirection = .horizontal
                layout.itemSize = CGSize(width: 100, height: 200)
                let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
                return collectionView
    }()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
}
extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemPink
        return cell;
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
}

