//
//  ViewController.swift
//  InputForm
//
//  Created by Kentarou on 2017/03/11.
//  Copyright © 2017年 Kentarou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var viewModel: ViewModel = ViewModel()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
    
        viewModel.bind { [weak self] in
            self?.tableView.refreshControl?.endRefreshing()
            self?.tableView.reloadData()
        }
        
        viewModel.reloadData()
    }
    
    @objc private func pullToRefresh() {
        viewModel.reloadData()
    }
}


extension ViewController: UITableViewDataSource {
    
    // Row Count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    // generateCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath as IndexPath) as? CustomCell {
            cell.person = viewModel[indexPath.row]
        }
        return UITableViewCell()
    }
}


