//
//  APIHelper.swift
//  BinBank
//
//  Created by Алексаndr on 08.04.17.
//  Copyright © 2017 xxx. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

class APIHelper {
    
    
    static let SERVER_IP="http://10.104.3.36:8000"
    
    static let LOGIN_URL = "\(SERVER_IP)/signin"
    static let REQUEST_BALANCE_URL = "\(SERVER_IP)/request_balance"
    static let GET_EXPENSE_URL = "\(SERVER_IP)/get_expense"
    static let GET_INCOME_URL = "\(SERVER_IP)/get_income"
    static let SOS_URL = "\(SERVER_IP)/sos"
    static let GET_CONSTRAINTS_URL = "\(SERVER_IP)/get_constraints"
    
    static let OK = 0
    static let ERROR = 1
    
    ////Вход
    class func logInRequest(child: Child) -> Void {
        
        let parameters: Parameters = [
            "email": child.email,
            "password": child.password
        ]
        
        request(URL: LOGIN_URL, method: .post, parameters: parameters, onSuccess: logInOnSuccess, onError: defaultOnError)
        
    }
    
    class func logInOnSuccess(json: JSON) -> Void {
        print(json)
        let code = json["code"].int!
        if code == OK {
            let data = json["data"].dictionaryObject
            NotificationCenter.default.post(name: .logInCallback, object: nil, userInfo: data)
        }
    }
    /*
    //Доходы
    class func getListOfIncome() -> Void {
        
        let child = DataBaseHelper.getChild()
        
        let parameters: Parameters = [
            "child_id": child.id
        ]
        
        request(URL: GET_INCOME_URL, method: .get, parameters: parameters, onSuccess: getListOfIncomeOnSuccess, onError: defaultOnError)
    }
    
    class func getListOfIncomeOnSuccess(json: JSON) -> Void{
        
        let code = json["code"].int!
        if code == OK {
            let data = json.dictionaryValue
            NotificationCenter.default.post(name: .getIncomeCallback, object: nil, userInfo: data)
        }
        
    }
    
    /////////Расходы
    class func getListOfExpense() -> Void {
        
        let child = DataBaseHelper.getChild()
        
        let parameters: Parameters = [
            "child_id": child.id
        ]
        
        request(URL: GET_LIST_OF_VEHICLES_URL, method: .get, parameters: parameters, onSuccess: getListOfExpenseOnSuccess, onError: defaultOnError)
    }
    
    class func getListOfExpenseOnSuccess(json: JSON) -> Void{
        
        let code = json["code"].int!
        if code == OK {
            let data = json.dictionaryValue
            NotificationCenter.default.post(name: .getExpenseCallback, object: nil, userInfo: data)
        }
        
    }
    
    ////Попросить деньги
    class func requestBalance() -> Void {
        
        let child = DataBaseHelper.getChild()
        
        let parameters: Parameters = [
            "child_id": child.id,
            "balance": child.balance
        ]
        
        request(URL: REQUEST_BALANCE_URL, method: .post, parameters: parameters, onSuccess: requestBalanceOnSuccess, onError: defaultOnError)
    }
    
    class func requestBalanceOnSuccess(json: JSON) -> Void{
        
        let code = json["code"].int!
        if code == OK {
            let data = json.dictionaryValue
            NotificationCenter.default.post(name: .requestbBalanceCallback, object: nil, userInfo: data)
        }
        
    }
    */
    ///Дефолтные штуки
    class func defaultOnSuccess(json: JSON) -> Void{
        print(json)
    }
    
    class func defaultOnError(error: Any) -> Void {
        print(error)
    }
    
    class func request(URL: String, method: HTTPMethod, parameters: Parameters, onSuccess: @escaping (JSON) -> Void , onError: @escaping (Any) -> Void) -> Void {
        Alamofire.request(URL, method: method, parameters: parameters ).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                onSuccess(json)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
}
