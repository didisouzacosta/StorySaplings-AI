//
//  StorySaplingsAIApp.swift
//  StorySaplingsAI
//
//  Created by ProDoctor on 22/05/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct StorySaplingsAIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    private let store = TaleStore()
    
    var body: some Scene {
        WindowGroup {
            MainScreenView()
        }
        .environment(store)
    }
}
