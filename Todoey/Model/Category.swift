//
//  Category.swift
//  Todoey
//
//  Created by Roman Akhtariev on 2018-08-11.
//  Copyright © 2018 Roman Akhtariev. All rights reserved.
//

import Foundation
import RealmSwift

class Category : Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
    @objc dynamic var color : String = ""
    
}
