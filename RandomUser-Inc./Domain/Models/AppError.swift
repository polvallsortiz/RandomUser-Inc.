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
        case .general: return "General error"
        case .apiError(let message): return "API error \(message ?? "")"
        case .parsing(let message): return "Parsing error \(message ?? "")"
        }
    }
}
