//
//  Item.swift
//  Todoey
//
//  Created by Roman Akhtariev on 2018-07-27.
//  Copyright © 2018 Roman Akhtariev. All rights reserved.
//

import Foundation

class Item : Encodable, Decodable {
    
    var text : String = ""
    var checked : Bool = false
    
}
