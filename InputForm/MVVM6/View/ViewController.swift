//
//  ViewController.swift
//  SampleSwiftBond
//
//  Copyright © 2016年 swift-studing.com. All rights reserved.
//

import UIKit
import Bond

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var hobbyTextField: UITextField!
    
    fileprivate var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.name.bidirectionalBind(to: nameTextField.reactive.text)
        viewModel.hobby.bidirectionalBind(to: hobbyTextField.reactive.text)
    }
}

