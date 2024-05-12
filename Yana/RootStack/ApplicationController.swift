//
//  ApplicationController.swift
//  Yana
//
//  Created by Andrius Shiaulis on 12.05.2024.
//

import Foundation
import OSLog

final class ApplicationController {

    // MARK: - Properties -

    private let persistentContainer = PersistentContainer(name: "Yana")
    private lazy var logger = Logger(reporterType: Self.self)

    // MARK: - Public API -

    func start() {
        Task {
            do {
                try await persistentContainer.start()
                self.logger.info("Application did start")
            } catch {
                logger.fault("Failed to start application: \(error)")
                fatalError("Failed to start application: \(error)")
            }
        }
    }
}
