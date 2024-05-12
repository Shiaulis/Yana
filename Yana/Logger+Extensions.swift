//
//  Logger+Extensions.swift
//  Yana
//
//  Created by Andrius Shiaulis on 12.05.2024.
//

import Foundation
import OSLog

extension Logger {

    private static let bundleIdentifier: String = Bundle.main.bundleIdentifier!

    /// Convenient init that is using main bundle identifier as subsystem and reporter type as category
    init<Reporter>(reporterType: Reporter.Type) {
        self.init(subsystem: Self.bundleIdentifier, category: String(describing: reporterType.self))
    }

}
