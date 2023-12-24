//
//  WebOSResponseApplication.swift
//  WebOSTV
//
//  Created by Ярослав on 12.12.2023.
//

import Foundation

struct WebOSResponseApplication: Codable {
    let id: String?
    let title: String?
    let icon: String?
    let folderPath: String?
    let version: String?
    let systemApp: Bool?
    let visible: Bool?
    let vendor: String?
    let type: String?
}
