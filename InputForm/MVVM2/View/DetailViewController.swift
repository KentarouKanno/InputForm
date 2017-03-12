//
//  AddViewController.swift
//  MVVM
//
//  Created by carlos on 8/4/15.
//  Copyright (c) 2015 Carlos García. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, DetailViewModelDelegate {
    
    var viewModel: DetailViewModel!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = viewModel.title
        nameField.text = viewModel.name
        amountField.text = viewModel.amount
        nameField.becomeFirstResponder()
        
        nameField.addTarget(self, action: #selector(DetailViewController.nameChanged), for: UIControlEvents.editingChanged)
        amountField.addTarget(self, action: #selector(DetailViewController.ammountChanged), for: UIControlEvents.editingChanged)
    }
    
    func nameChanged() {
        viewModel.name = nameField.text!
        resultLabel.text = viewModel.infoText
    }
    
    func ammountChanged() {
        viewModel.amount = amountField.text!
        resultLabel.text = viewModel.infoText
    }
    
    
    // MARK: - AddViewModelDelegate
    
    func showInvalidName() {
        UIAlertView(title: "Error", message: "Invalid name", delegate: nil, cancelButtonTitle: "OK").show()
        nameField.becomeFirstResponder()
    }
    
    func showInvalidAmount() {
        UIAlertView(title: "Error", message: "Invalid amount", delegate: nil, cancelButtonTitle: "OK").show()
        amountField.becomeFirstResponder()
    }
    
    func dismissAddView() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    
    // MARK: - IBActions
    
    @IBAction func cancelPressed(_ sender: AnyObject) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func donePressed(_ sender: AnyObject) {
        viewModel.handleDonePressed()
    }

}
