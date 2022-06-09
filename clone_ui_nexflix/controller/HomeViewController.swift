//
//  HomeViewController.swift
//  clone_ui_nexflix
//
//  Created by ATIAdmin on 09/06/2022.
//

import UIKit

class HomeViewController: UIViewController {
    let sectionTitles: [String] = ["Trending Movies", "Trending Tv", "Popular", "Upcoming Movies", "Top rated"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        addTableView()
        addNavigatorBar()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        handleViewTable.frame = view.bounds
    }
    private let handleViewTable:UITableView = {
        let table = UITableView(frame: .zero, style:UITableView.Style.grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.indentify)
        return table
    }()
    private func addTableView(){
        view.addSubview(handleViewTable)
        handleViewTable.delegate = self
        handleViewTable.dataSource = self
        handleViewTable.tableHeaderView = HeroHeaderUiView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 600))
    }
    private func addNavigatorBar(){
        var image = UIImage(named:"netflix_logo")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName:  "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        navigationController?.navigationBar.tintColor = .white
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = (tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.indentify, for: indexPath) as? CollectionViewTableViewCell) else {
            return UITableViewCell()
        }
        return cell  
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 14,weight:.regular)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x +  20, y: header.bounds.origin.y  , width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
    }
    func tableView(_ tableView:UITableView, heightForRowAt indexPath:IndexPath)->CGFloat{
        return 200
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}
