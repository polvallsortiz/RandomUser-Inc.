//
//  Config.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 1/4/22.
//

import Foundation

enum ConfigKeys: String {
    case baseUrl = "BASE_URL"
    case appName = "APP_NAME"
}

enum Config {
    
    static func configurationName() -> String {
        guard let configuration = Bundle.main.infoDictionary?["Configuration"] as? String else {
            fatalError("CONFIGURATION NOT DEFINED")
        }
        return configuration
    }

    static func getBaseUrl() -> String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: ConfigKeys.baseUrl.rawValue) as? String
        else { fatalError("BASE_URL NOT DEFINED") }
        return value
    }

    static func getAppName() -> String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: ConfigKeys.appName.rawValue) as? String
        else { fatalError("APP_NAME NOT DEFINED") }
        return value
    }
}
