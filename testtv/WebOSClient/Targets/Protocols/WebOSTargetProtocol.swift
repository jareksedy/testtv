//
//  WebOSTargetProtocol.swift
//  WebOSTV
//
//  Created by Ярослав on 09.12.2023.
//

import Foundation

protocol WebOSTargetProtocol {
    var uri: String? { get }
    var request: WebOSRequest { get }
}
