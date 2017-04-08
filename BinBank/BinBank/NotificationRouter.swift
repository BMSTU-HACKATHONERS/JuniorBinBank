//
//  NotificationRouter.swift
//  BinBank
//
//  Created by Алексаndr on 08.04.17.
//  Copyright © 2017 xxx. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let logInCallback = Notification.Name("logInCallback")
    static let getIncomeCallback = Notification.Name("getIncomeCallback")
    static let getExpenseCallback = Notification.Name("getExpenseCallback")
    static let requestbBalanceCallback = Notification.Name("requestBalanceCallback")
}
