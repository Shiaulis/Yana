//
//  PersistentContainer.swift
//  Yana
//
//  Created by Andrius Shiaulis on 12.05.2024.
//

import Foundation
import CoreData
import OSLog

final class PersistentContainer: NSPersistentContainer {

    // MARK: - Properties -

    private lazy var logger = Logger(reporterType: Self.self)

    // MARK: - Public API -

    func start() async throws {
        try await withCheckedThrowingContinuation { continuation in
            loadPersistentStores { _, error in
                if let error {
                    continuation.resume(throwing: error)
                    return
                }

                continuation.resume()
            }
        } as Void
    }

}
