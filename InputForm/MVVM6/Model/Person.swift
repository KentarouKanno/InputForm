//
//  Person.swift
//  SampleSwiftBond
//
//  Copyright © 2016年 swift-studing.com. All rights reserved.
//

import UIKit

final class Person: NSObject, NSCoding {
    
    var name = ""
    var hobby = ""
    
    override init() {
        super.init()
    }
    
    internal func update() {
        let archive = NSKeyedArchiver.archivedData(withRootObject: self)
        let userdefaults = UserDefaults.standard
        userdefaults.set(archive, forKey: "Person")
    }
    
    class func loadPerson() -> Person? {
        let userdefaults = UserDefaults.standard
        guard let unarchived = userdefaults.object(forKey: "Person") as? Data else {
            return Person()
        }
        
        return (NSKeyedUnarchiver.unarchiveObject(with: unarchived) as? Person) ?? Person()
    }
    
    // ユーザーデフォルトに保存するため
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.hobby, forKey: "hobby")
    }
    
    // ユーザーデフォルトに保存するため
    init?(coder aDecoder: NSCoder) {
        super.init()
        self.name = (aDecoder.decodeObject(forKey: "name") as? String) ?? ""
        self.hobby = (aDecoder.decodeObject(forKey: "hobby") as? String) ?? ""
    }
}
