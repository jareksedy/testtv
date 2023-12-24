//
//  ViewModel.swift
//  testtv
//
//  Created by Ярослав on 23.12.2023.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var volumeLevel: Double
    @Published var clientKey: String? = nil
    @Published var showPromptAlert: Bool = false
    
    var tv: WebOSClientProtocol?
    
    init() {
        //UserDefaults.standard.setValue(nil, forKey: "clientKey")
        volumeLevel = 0
        let url = URL(string: "wss://192.168.8.10:3001")
        self.tv = WebOSClient(url: url, delegate: self)
        tv?.connect()
        let clientKey = UserDefaults.standard.value(forKey: "clientKey") as? String
        tv?.send(.register(clientKey: clientKey))
    }
    
    func setVolume(_ volume: Int) {
        tv?.send(.setVolume(volume))
    }
}

extension ViewModel: WebOSClientDelegate {
    func didPrompt() {
        showPromptAlert = true
    }
    
    func didRegister(with clientKey: String) {
        print("Registered with client key: \(clientKey).")
        UserDefaults.standard.setValue(clientKey, forKey: "clientKey")
        tv?.send(.getVolume(subscribe: true), id: "volume")
        Task { @MainActor in
            self.clientKey = clientKey
        }
    }
    
    func didReceive(_ result: Result<WebOSResponse, Error>) {
        if case .success(let response) = result, response.id == "volume" {
            Task { @MainActor in
                self.volumeLevel = Double(response.payload?.volumeStatus?.volume ?? 0)
            }
        }
    }
    
    func didReceiveNetworkError(_ error: Error?) {
    }
}
