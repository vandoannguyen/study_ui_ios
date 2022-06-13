//
//  HeroHeaderUiView.swift
//  clone_ui_nexflix
//
//  Created by ATIAdmin on 09/06/2022.
//

import UIKit

class HeroHeaderUiView: UIView {
    private var tags = ["Rousing", "Inspiring", "Comedy", "Basketball", "Hollyword", "Drama"]
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageHeader)
        addGradient()
        addStackView()
        addTableView()
    }
    private func addTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(white: 100, alpha: 0)
        tableView.backgroundColor = .yellow
        let contraint = [
            tableView.heightAnchor.constraint(equalToConstant: 50),
            tableView.widthAnchor.constraint(equalToConstant: bounds.width),
        ]
        NSLayoutConstraint.activate(contraint)
        addSubview(tableView)
    }
    let tableView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let table = UICollectionView(frame: .zero,collectionViewLayout: layout)
        table.register(TagViewCells.self, forCellWithReuseIdentifier: TagViewCell.indentify)
        return table
    }()
    private func addStackView(){
        let stackView = UIStackView(frame:.zero)
        stackView.axis = .horizontal
        stackView.spacing = 100
//        stackView.backgroundColor = .red
        stackView.distribution = UIStackView.Distribution.fillEqually;
        stackView.alignment = UIStackView.Alignment.center;
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        let contraint = [
            stackView.heightAnchor.constraint(equalToConstant: 40 ),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25)
        ]
        NSLayoutConstraint.activate(contraint)
        addPlayButton(parent: stackView)
        addDownloadButton(parent: stackView)
    }
    private let imageHeader:UIImageView = {
        let imageView = UIImageView()
       imageView.contentMode = .scaleToFill
       imageView.clipsToBounds = true
       imageView.image = UIImage(named: "header_poster")
        return imageView
    }()
    private let playButton:UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Play", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func  configButton()->UIButton{
        let button = UIButton()
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 3
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    private func addDownloadButton( parent:UIStackView){
        let downloadButton:UIButton = configButton()
        downloadButton.setTitle("Download", for:.normal)
            parent.addArrangedSubview(downloadButton)
        let contraint = [
            downloadButton.widthAnchor.constraint(equalToConstant: 100 ),
        ]
        NSLayoutConstraint.activate(contraint)
    }
    
    private func addPlayButton(parent:UIStackView){
        let playButton:UIButton = configButton()
        playButton.setTitle("Play", for:.normal)
        parent.addArrangedSubview(playButton)
        let contraint = [
            playButton.widthAnchor.constraint(equalToConstant: 100),
//            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
//            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
        ]
        NSLayoutConstraint.activate(contraint)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageHeader.frame = bounds
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    func addGradient(){
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.clear.cgColor,
            UIColor.black.cgColor
        ]
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
    
}
extension HeroHeaderUiView: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagViewCell.indentify, for: indexPath) as! TagViewCell
        return cell
    }
}
