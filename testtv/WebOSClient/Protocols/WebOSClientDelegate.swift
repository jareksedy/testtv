//
//  WebOSClientDelegate.swift
//  WebOSTV
//
//  Created by Ярослав on 09.12.2023.
//

import Foundation

protocol WebOSClientDelegate: AnyObject {
    func didConnect()
    func didPrompt()
    func didRegister(with clientKey: String)
    func didReceive(_ result: Result<WebOSResponse, Error>)
    func didReceive(_ json: String)
    func didReceiveNetworkError(_ error: Error?)
    func didDisconnect()
}

extension WebOSClientDelegate {
    func didConnect() {}
    func didPrompt() {}
    func didReceive(_ json: String) {}
    func didDisconnect() {}
}
