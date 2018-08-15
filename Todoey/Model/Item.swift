//
//  Item.swift
//  Todoey
//
//  Created by Roman Akhtariev on 2018-08-11.
//  Copyright © 2018 Roman Akhtariev. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated : Date?
    var parentCategory = LinkingObjects(fromType: Category.self , property: "items")
}
