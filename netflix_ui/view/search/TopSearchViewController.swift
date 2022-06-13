//
//  TopSearchViewController.swift
//  netflix_ui
//
//  Created by Nguyen Van Doan OS  on 11/06/2022.
//

import UIKit

class TopSearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate  = self
        tableView.register(UINib(nibName: "ItemTopSearchTableViewCell", bundle: nil), forCellReuseIdentifier: ItemTopSearchTableViewCell.indentify)
    }
}
extension TopSearchViewController :UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTopSearchTableViewCell.indentify, for: indexPath) as! ItemTopSearchTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
