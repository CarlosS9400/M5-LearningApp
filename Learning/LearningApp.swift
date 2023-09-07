//
//  LearningApp.swift
//  Learning
//
//  Created by Carlos Dos santos on 06/09/2023.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ModuleViewModel())
        }
    }
}
