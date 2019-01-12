//
//  CommentViewController.swift
//  Assignment
//
//  Created by Narendra Satpute on 12/01/19.
//  Copyright © 2019 Digi. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var commentList = [Comment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
        self.title = "Comments"
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: TableCellConstant.CommentCell, bundle: nil), forCellReuseIdentifier: TableCellConstant.CommentCell)
        tableView.tableFooterView = UIView(frame: .zero)
    }

   

}

extension CommentViewController: UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let obj = commentList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCellConstant.CommentCell, for: indexPath) as! CommentCell
        cell.setUpData(message: obj)
        return cell
    }
}
