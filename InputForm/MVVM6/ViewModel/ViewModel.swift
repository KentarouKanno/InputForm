//
//  ViewModel.swift
//  SampleSwiftBond
//
//  Copyright © 2016年 swift-studing.com. All rights reserved.
//

import Foundation
import Bond

class ViewModel{
    
    var name = Observable<String?>("")
    var hobby = Observable<String?>("")
    
    fileprivate let person: Person

    init() {
        self.person = Person.loadPerson() ?? Person()
        self.name.value = self.person.name
        self.hobby.value = self.person.hobby
        
        // nameプロパティが更新されるとpersonを修正し、永続化
        _ = name.observeNext{ obj in
            
            if let text = obj{
                self.person.name = text
                self.person.update()
            }
        }

        // hobbyプロパティが更新されるとpersonを修正し、永続化
        _ = hobby.observeNext{
            obj in
            if let text = obj{
                self.person.hobby = text
                self.person.update()
            }
        }
    }
}
