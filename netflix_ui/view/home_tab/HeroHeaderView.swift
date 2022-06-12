//
//  HeroHeaderView.swift
//  netflix_ui
//
//  Created by Nguyen Van Doan OS  on 12/06/2022.
//

import UIKit

class HeroHeaderView: UIView {
   private let imageHeader:UIImageView = {
        let imageView = UIImageView()
       imageView.contentMode = .scaleToFill
       imageView.image = UIImage(named:"header_poster")
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
        backgroundColor = .systemPink
        addSubview(imageHeader)
        addGradient()
        addStackView()
//        addPlayButton()
//        addDownloadButton()
    }
    private let stackView:UIStackView={
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(
            getButtonMyList(imageName: "plus", title: "My List", axis: nil, backGround: nil)
        )
        stackView.addArrangedSubview(buttonPlay())
        stackView.addArrangedSubview(
            getButtonMyList(imageName: "info.circle", title: "Infor",axis: nil,backGround: nil)
        )
        return stackView
    }()
    static func buttonPlay()->UIStackView {
        let stack = UIStackView(frame: .zero)
        stack.alignment = .center
        stack.distribution = .equalCentering
        let stackView = UIStackView(frame:.zero)
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 2
        stackView.alignment = .center
        stackView.distribution = .fill
        let imageView = UIImageView(image: UIImage(systemName: "play.fill"))
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        stackView.addArrangedSubview(imageView)
        let label = UILabel()
        label.text = "Play"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 16 , weight: UIFont.Weight.bold)
        stackView.spacing = 8
        stackView.addArrangedSubview(label)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let contraint = [
            stackView.heightAnchor.constraint(equalToConstant: 45),
            imageView.heightAnchor.constraint(equalToConstant: 30),
            imageView.widthAnchor.constraint(equalToConstant: 30),
            label.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -15),
            imageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 15)
        ]
        stack.addArrangedSubview(UIView())
        stack.addArrangedSubview(stackView)
        stack.addArrangedSubview(UIView())
        stack.addConstraints(contraint)
        return stack
    }
    static func getButtonMyList(imageName:String, title:String, axis:NSLayoutConstraint.Axis?, backGround: UIColor?)->UIView{
        let stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 0, height: 60))
        stackView.axis = axis ?? .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = backGround
        let image:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        image.image = UIImage(systemName: imageName)
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
//        image.fram = CGSize(width: 30, height: 30)
        let label = UILabel(frame: .zero)
        label.text = title
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(label)
        return stackView
    }
    private func addStackView(){
        addSubview(stackView)
        let contraint = [
            stackView.widthAnchor.constraint(equalToConstant: bounds.width ),
            stackView.heightAnchor.constraint(equalToConstant: 60),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
        ]
        NSLayoutConstraint.activate(contraint)
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
