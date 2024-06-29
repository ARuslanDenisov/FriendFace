//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Руслан on 28.06.2024.
//

import SwiftUI
import SwiftData

@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: PersonModel.self)
    }
}
