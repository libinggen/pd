//
//  Database.swift
//  SwiftUI-MVVM
//
//  Created by LiBinggen on 2022/3/25.
//

import Foundation
import RealmSwift

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
    
}
