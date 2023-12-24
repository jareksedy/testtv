//
//  WebOSResponseVolumeStatus.swift
//  WebOSTV
//
//  Created by Ярослав on 09.12.2023.
//

import Foundation

struct WebOSResponseVolumeStatus: Codable {
    let volumeLimitable: Bool?
    let activeStatus: Bool?
    let maxVolume: Int?
    let volumeLimiter: String?
    let soundOutput: String?
    let volume: Int?
    let mode: String?
    let externalDeviceControl: Bool?
    let muteStatus: Bool?
    let volumeSyncable: Bool?
    let adjustVolume: Bool?
}
