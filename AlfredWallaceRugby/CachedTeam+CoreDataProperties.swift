//
//  CachedTeam+CoreDataProperties.swift
//  AlfredWallaceRugby
//
//  Created by Arthur Falque Pierrotin on 21/11/2022.
//
//

import Foundation
import CoreData


extension CachedTeam {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedTeam> {
        return NSFetchRequest<CachedTeam>(entityName: "CachedTeam")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var abbreviation: String?
    @NSManaged public var initialPoints: Double
    @NSManaged public var points: String?

    var wrappedName: String {
        name ?? ""
    }
    
    var wrappedAbbreviation: String {
        abbreviation ?? ""
    }
    
    var wrappedPoints: String {
        points ?? ""
    }
}

extension CachedTeam : Identifiable {

}
