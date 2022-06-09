//
//  ViewController.swift
//  clone_ui_nexflix
//
//  Created by ATIAdmin on 09/06/2022.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpCommingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: DoanloadViewController())
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass.circle")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.circle")
        
        vc1.title = "Home"
        vc2.title = "Comming Soon"
        vc3.title = "Top Search"
        vc4.title = "Dopwnloads"
        tabBar.tintColor = .white
    }


}

