//
//  TableViewController.swift
//  MVVM
//
//  Created by Jure Zove on 01/05/16.
//  Copyright © 2016 Jure Zove. All rights reserved.
//


// http://candycode.io/a-practical-mvvm-example-in-swift-part-1/

import UIKit

class TableViewController: UITableViewController {
    
    let cars: [CarViewModel] = {
        let ferrariF12 = Car(model: "F12", make: "Ferrari", kilowatts: 544, photoURL: "http://auto.ferrari.com/en_EN/wp-content/uploads/sites/5/2013/07/Ferrari-F12berlinetta.jpg")
        let zondaF = Car(model: "Zonda F", make: "Pagani", kilowatts: 449, photoURL: "http://storage.pagani.com/view/1024/BIG_zg-4-def.jpg")
        let lamboAventador = Car(model: "Aventador", make: "Lamborghini", kilowatts: 522, photoURL: "http://cdn.lamborghini.com/content/models/aventador_lp700-4_roadster/gallery_2013/roadster_21.jpg")
        
        return [CarViewModel(car: ferrariF12), CarViewModel(car: zondaF), CarViewModel(car: lamboAventador)]
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - TableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath)
        let carViewModel = cars[indexPath.row]
        
        cell.textLabel?.text = carViewModel.titleText
        cell.detailTextLabel?.text = carViewModel.horsepowerText
        loadImage(cell, photoURL: carViewModel.photoURL as URL?)
        
        return cell
    }
    
    func loadImage(_ cell: UITableViewCell, photoURL: URL?) {
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            guard let imageURL = photoURL, let imageData = try? Data(contentsOf: imageURL) else {
                return
            }
            DispatchQueue.main.async {
                cell.imageView?.image = UIImage(data: imageData)
                cell.setNeedsLayout()
            }
        }
    }
}
