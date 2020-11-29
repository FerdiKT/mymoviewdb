//
//  mymoviedbApp.swift
//  mymoviedb
//
//  Created by Ferdi Kızıltoprak on 29.11.2020.
//

import SwiftUI
import Firebase

@main
struct mymoviedbApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
