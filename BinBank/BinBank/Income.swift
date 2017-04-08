//
//  Income.swift
//  BinBank
//
//  Created by Алексаndr on 08.04.17.
//  Copyright © 2017 xxx. All rights reserved.
//

import Foundation
import RealmSwift

class Income: Object{
    dynamic var id = 0
    dynamic var value = 0
    dynamic var type = 0
    dynamic var child: Child?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func getDescription() -> String {
        
        switch type {
        case 0: return "Кэшбэк"
        case 1: return "Пополнение"
        default: return ""
        }
    }
    
}
