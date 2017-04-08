//
//  Parent.swift
//  BinBank
//
//  Created by Алексаndr on 08.04.17.
//  Copyright © 2017 xxx. All rights reserved.
//

import Foundation
import RealmSwift

class Parent: Object{
    dynamic var id = 0
    dynamic var firstname = ""
    dynamic var lastname = ""
    dynamic var phone = ""
    dynamic var balance = 0
    dynamic var email = ""
    dynamic var password = ""
    //let childs = LinkingObjects(fromType: Child.self, property: "parent")
}
