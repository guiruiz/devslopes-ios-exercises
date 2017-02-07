//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by Guilherme Ruiz on 27/01/17.
//  Copyright © 2017 Guilherme Ruiz. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.created = NSDate()
    }
}
