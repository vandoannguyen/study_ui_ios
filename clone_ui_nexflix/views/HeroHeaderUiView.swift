//
//  HeroHeaderUiView.swift
//  clone_ui_nexflix
//
//  Created by ATIAdmin on 09/06/2022.
//

import UIKit

class HeroHeaderUiView: UIView {
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
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageHeader)
        addGradient()
        addPlayButton()
        addDownloadButton()
    }
    private func addDownloadButton(){
        let downloadButton:UIButton = configButton()
        downloadButton.setTitle("Download", for:.normal)
        addSubview(downloadButton)
        let contraint = [
            downloadButton.widthAnchor.constraint(equalToConstant: 100 ),
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
        ]
        NSLayoutConstraint.activate(contraint)
    }
    
    private func addPlayButton(){
        let playButton:UIButton = configButton()
        playButton.setTitle("Play", for:.normal)
        addSubview(playButton)
        let contraint = [
            playButton.widthAnchor.constraint(equalToConstant: 100),
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
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
