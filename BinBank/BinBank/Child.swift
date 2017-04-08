//
//  Child.swift
//  BinBank
//
//  Created by Алексаndr on 08.04.17.
//  Copyright © 2017 xxx. All rights reserved.
//

import Foundation
import RealmSwift

class Child: Object{
    dynamic var id = 0
    dynamic var email : String = ""
    dynamic var password : String = ""
    dynamic var firstname : String = ""
    dynamic var lastname : String = ""
    dynamic var phone : String = ""
    dynamic var balance = 0
    dynamic var parent_ID = 0
    dynamic var online_cashing_bit = 0
    dynamic var max_per_day = 0
    dynamic var max_payment = 0
    dynamic var low_balance = 0
    dynamic var max_cashing = 0
    dynamic var parent: Parent?
    //let incomes = LinkingObjects(fromType: Income.self, property: "child")
    //let expenses = LinkingObjects(fromType: Expense.self, property: "child")
    //let places = LinkingObjects(fromType: Places.self, property: "child")
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
