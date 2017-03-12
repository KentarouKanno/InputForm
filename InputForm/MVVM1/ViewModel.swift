//
//  ViewModel1.swift
//  InputForm
//
//  Created by Kentarou on 2017/03/11.
//  Copyright © 2017年 Kentarou. All rights reserved.
//

import Foundation


protocol ViewModelProtocol: class {
    
    var count: Int { get }
    subscript(index: Int) -> Person { get }
    
    func bind(didChange: @escaping () -> Void)
    func reloadData()
}

class ViewModel: ViewModelProtocol {
    
    private var cellDataArray: [Person] = [] {
        didSet {
            didChange?()
        }
    }
    
    var count: Int {
        return cellDataArray.count
    }
    
    subscript(index: Int) -> Person {
        return  cellDataArray[index]
    }
    
    
    private var didChange: (() -> Void)?
    
    func bind(didChange: @escaping () -> Void) {
        self.didChange = didChange
    }
    
    func reloadData() {
        
        let person1 = Person(name: "Taro", age: 10)
        let person2 = Person(name: "Hanako", age: 8)
        
        self.cellDataArray = [person1, person2]
    }
}
