//
//  SplashViewModel.swift
//  mymoviedb
//
//  Created by Ferdi Kızıltoprak on 29.11.2020.
//

import Foundation
import FirebaseRemoteConfig

class SplashViewModel: ObservableObject {

    @Published var splashName: String = ""
    @Published var error: String = ""
    @Published var showError: Bool = false

    func getSplashName() {
        let remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings

        remoteConfig.fetch() { (status, error) -> Void in
            if status == .success {
                remoteConfig.activate()
            }
            if let name = remoteConfig.value(forKey: "splash_name") as? String {
                self.splashName = name
            } else {
                self.error = "Bir Hata Oluştu"
                self.showError = true
            }

        }
    }
}
