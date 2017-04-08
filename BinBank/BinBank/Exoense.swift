//
//  Exoense.swift
//  BinBank
//
//  Created by Алексаndr on 08.04.17.
//  Copyright © 2017 xxx. All rights reserved.
//

import Foundation
import RealmSwift

class Expense: Object{
    
    dynamic var id = 0
    dynamic var value = 0
    dynamic var type = 0
    dynamic var child: Child?
    
    func getDescription() -> String {
        
        switch type {
            case 0: return "Снятие наличных"
            case 1: return "Онлайн платеж"
            case 2: return "Оплата питания"
            case 3: return "Оплата через терминал"
            case 4: return "Покупка в Store"
            default: return ""
        }
    }
}

