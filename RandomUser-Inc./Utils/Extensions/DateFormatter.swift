//
//  DateFormatter.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 7/4/22.
//

import Foundation

extension DateFormatter {
    func defaultFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        if let locale = Bundle.main.preferredLocalizations.first?.prefix(2) {
            formatter.locale = Locale(identifier: String(locale))
        } else {
            formatter.locale = Locale(identifier: "en")
        }
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyyMMdd", options: 0, locale: formatter.locale)
        return formatter
    }
}
