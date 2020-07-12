//
//  Data.swift
//  my service book
//
//  Created by Умид Халилов on 25.04.2020.
//  Copyright © 2020 Умид Халилов. All rights reserved.
//

import Foundation
import CoreData

public class mark: NSManagedObject, Identifiable{
    
    @NSManaged public var markId: Date?
    @NSManaged public var name: String?
}

//extension 
