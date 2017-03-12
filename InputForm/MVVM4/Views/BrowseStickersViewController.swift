//
//  BrowseStickersViewController.swift
//  ProtocolOrientedMVVM
//
//  Created by kumapo on 2016/11/23.
//  Copyright © 2016年 kumapo. All rights reserved.
//

import UIKit

class BrowseStickersViewController: UITableViewController {
    
    let viewModel = BrowseStickersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - TableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StickerCell", for: indexPath)
        
        if let stickerCell = cell as? StickerCell {
            stickerCell.viewModel = viewModel.cellViewModels[indexPath.row]
            return stickerCell
        }
        return cell
    }
}
