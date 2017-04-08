//
//  DatabaseHelper.swift
//  BinBank
//
//  Created by Алексаndr on 08.04.17.
//  Copyright © 2017 xxx. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class DatabaseHelper {
    
    static let realm = try! Realm()
    
    class func getChild() -> Child{
        //let predicate = NSPredicate(format: "email == child@mail.ru")
        return realm.objects(Child.self).first!
    }
    
    class func setChild(child: Child, id: Int, email: String, firstname: String, lastname: String, phone: String, balance: Int, parent_ID: Int, online_cashing_bit: Int, max_per_day: Int, max_payment: Int, low_balance: Int, max_cashing: Int){
        child.id = id
        child.email = email
        child.firstname = firstname
        child.lastname = lastname
        child.phone = phone
        child.balance = balance
        child.parent_ID = parent_ID
        child.online_cashing_bit = online_cashing_bit
        child.max_per_day = max_per_day
        child.max_payment = max_payment
        child.low_balance = low_balance
        child.max_cashing = max_cashing
        save(object: child)
    }
    
    
    class func save(object: Object){
        try! realm.write {
            realm.add(object, update: true)
        }
    }
}
