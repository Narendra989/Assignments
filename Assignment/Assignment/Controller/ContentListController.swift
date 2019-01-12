//
//  ContentListController.swift
//  Assignment
//
//  Created by Narendra Satpute on 12/01/19.
//  Copyright © 2019 Digi. All rights reserved.
//

import UIKit



class ContentListController: UIViewController, ContentCallback {

    @IBOutlet weak var tableView: UITableView!
    var contentList = [Content]()
  var isLoading = false
    
    let contentViewModel = ContentViewModel()
    //MARK:- View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        AppLoader.showLoader(view: self.view)
        contentViewModel.getAllContent()
        self.title = "Contents"
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
    }
    
    //Setup table view delegate and data source
    func setupTableView() {
        contentViewModel.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        // Register custom cell to table view
        
        tableView.register(UINib.init(nibName: TableCellConstant.ContentCell, bundle: nil), forCellReuseIdentifier: TableCellConstant.ContentCell)
    }
    
    //MARK:- Content call Back
    
    func getAllContents(list: [Content]?) {
        AppLoader.hideLoader(view: self.view)
        if let contents = list {
            contentList.append(contentsOf: contents)
            tableView.reloadData()
        }
    }
    
}


//MARK:- TableView Delegate and Data source Method

extension ContentListController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let obj = contentList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath) as! ContentCell
        cell.setupData(content: obj)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let obj = contentList[indexPath.row]
        let commentVc = self.storyboard?.instantiateViewController(withIdentifier: "CommentViewController") as! CommentViewController
        if let comments = obj.comment {
            commentVc.commentList = comments
        }
        
        self.navigationController?.pushViewController(commentVc, animated: true)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        isLoading = false
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        // Pagination logic
        if (tableView.contentOffset.y + tableView.frame.size.height) >= tableView.contentSize.height {
            
            if !isLoading {
                isLoading = true
                AppLoader.showLoader(view: self.view)
                contentViewModel.getAllContent()
            }
        }
    }
}
