//
//  Configuration.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 22/07/21.
//

import Foundation

class ConfigLoader {
    static let ConfigName = "Config.plist"

    static func parseFile(named fileName: String = ConfigName) -> Configuration {
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: nil),
            let fileData = FileManager.default.contents(atPath: filePath)
        else {
            fatalError("Config file '\(fileName)' not loadable!")
        }

        do {
            let config = try PropertyListDecoder().decode(Configuration.self, from: fileData)
            return config
        } catch {
            fatalError("Configuration not decodable from '\(fileName)': \(error)")
        }
    }
}

struct Configuration: Decodable {
    let environment: String
    let httpScheme: String
    let host: String
    let path: String
    let appid: String
    let testFlags: TestFlags?
}

struct TestFlags: Decodable {
    let showSplash: Bool
}

let config = ConfigLoader.parseFile()
