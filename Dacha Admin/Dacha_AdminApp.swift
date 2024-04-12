//
//  Dacha_AdminApp.swift
//  Dacha Admin
//
//  Created by Artem Martirosyan on 26.09.2023.
//

import SwiftUI

@main
struct Dacha_AdminApp: App {
    @StateObject private var lockersSystem = LockersSystem.loadLockers()!

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(lockersSystem)
        }
    }
}
