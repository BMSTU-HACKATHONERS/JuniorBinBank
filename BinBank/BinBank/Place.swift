//
//  Place.swift
//  BinBank
//
//  Created by Алексаndr on 08.04.17.
//  Copyright © 2017 xxx. All rights reserved.
//

import Foundation
import RealmSwift

class Place: Object{
    dynamic var id = 0
    dynamic var longitude = 0.0
    dynamic var latitude = 0.0
    dynamic var child: Child?
}
