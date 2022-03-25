//
//  Database.swift
//  SwiftUI-MVVM
//
//  Created by LiBinggen on 2022/3/25.
//

import Foundation
import RealmSwift

extension Realm {
    public func safeWrite(_ block: (() throws -> Void)) throws {
        if isInWriteTransaction {
            try block()
        } else {
            try write(block)
        }
    }
}

public typealias DB = Database

public class Database {
    
    public class func setupDatabase() {
        var config = Realm.Configuration.defaultConfiguration
        config.deleteRealmIfMigrationNeeded = true
        let fileUrl = FileManager.default
            .containerURL(forSecurityApplicationGroupIdentifier: "group.pd.libinggen")?
            .appendingPathComponent("pd.realm")
        if let url = fileUrl {
            config.fileURL = url
        }
        debugPrint("Realm stored at: \(config.fileURL?.absoluteString ?? "")")
        Realm.Configuration.defaultConfiguration = config
        Realm.asyncOpen(configuration: config) { result in
            switch result {
            case .success(let realm):
                debugPrint("Realm on async open: \(realm)")
            case .failure(let error):
                debugPrint("No realm on async open: \(error)")
            }
        }
    }
    
    private class func getRealm() -> Realm? {
        return try? Realm()
    }
    
    public class func get<Element: Object, KeyType>(ofType type: Element.Type, forPrimaryKey key: KeyType) -> Element? {
        return getRealm()?.object(ofType: type.self, forPrimaryKey: key)
    }
    
    public class func getAll<Element: RealmFetchable>(_ type: Element.Type) -> Results<Element>? {
        return getRealm()?.objects(type.self)
    }
    
    public class func get(object realmObject: Object?, update: Realm.UpdatePolicy = .all) {
        if let object = realmObject {
            let realm = getRealm()
            realm?.refresh()
            try? realm?.safeWrite {
                realm?.add(object, update: update)
            }
        }
    }
    
    public class func save(object realmObject: Object?, update: Realm.UpdatePolicy = .all) {
        if let object = realmObject {
            let realm = getRealm()
            realm?.refresh()
            try? realm?.safeWrite {
                realm?.add(object, update: update)
            }
        }
    }
    
    public class func save(objects realmObjects: [Object]?, update: Realm.UpdatePolicy = .all) {
        if let objects = realmObjects {
            let realm = getRealm()
            realm?.refresh()
            try? realm?.safeWrite {
                realm?.add(objects, update: update)
            }
        }
    }
    
    public class func delete(object: Any) {
        if let realmObject = object as? Object {
            let realm = getRealm()
            realm?.refresh()
            try? realm?.safeWrite {
                realm?.delete(realmObject)
            }
        }
    }
    
    public class func updateCall(_ transaction: ((Realm) -> Void)) {
        if let realm = getRealm() {
            realm.refresh()
            try? realm.safeWrite {
                transaction(realm)
            }
        }
    }
    
    public class func clearDatabase() {
        let realm = getRealm()
        realm?.refresh()
        try? realm?.safeWrite {
            realm?.deleteAll()
        }
    }
}
