//
//  SwiftUI_MVVMApp.swift
//  SwiftUI-MVVM
//
//  Created by LiBinggen on 2022/3/24.
//

import SwiftUI

@main
struct SwiftUI_MVVMApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
