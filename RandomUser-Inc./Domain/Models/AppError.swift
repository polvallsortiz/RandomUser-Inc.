//
//  AppError.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 7/4/22.
//

import Foundation

enum AppError: Error, LocalizedError {
    case general
    case apiError(message: String?)
    case parsing(message: String?)

    var errorDescription: String? {
        switch self {
        case .general: return "error.general.description".localized()
        case .apiError(let message): return "\("error.api.description".localized()): \(message ?? "")"
        case .parsing(let message): return "\("error.parsing.description".localized()) \(message ?? "")"
        }
    }
}
