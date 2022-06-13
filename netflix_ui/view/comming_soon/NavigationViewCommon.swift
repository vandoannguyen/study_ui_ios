//
//  NavigationViewCommon.swift
//  netflix_ui
//
//  Created by ATIAdmin on 13/06/2022.
//

import UIKit

class NavigationViewCommon: UIView {
    var labelTitle:String = "New & Hot"
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubView()
    }
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    private func createSubView(){
        let stackView = UIStackView();
        stackView.axis = .horizontal
        stackView.alignment = .firstBaseline
        stackView.distribution = .fillProportionally
        ///add label
        let label = UILabel()
        label.text = labelTitle
        stackView.addArrangedSubview(label)
        addSubview(stackView)
        let contraint = [
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ]
        addConstraints(contraint)
    }
}
