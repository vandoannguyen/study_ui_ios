//
//  CommingSoonViewController.swift
//  netflix_ui
//
//  Created by Nguyen Van Doan OS  on 11/06/2022.
//

import UIKit

class CommingSoonViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableCommingTableViewCell", bundle: nil), forCellReuseIdentifier: TableCommingTableViewCell.indentify)
    }
}
extension CommingSoonViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCommingTableViewCell.indentify, for: indexPath) as! TableCommingTableViewCell
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
}
