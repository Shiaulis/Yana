//
//  ApplicationViewModel.swift
//  Yana
//
//  Created by Andrius Shiaulis on 12.05.2024.
//

import Foundation
import OSLog

final class ApplicationViewModel {

    // MARK: - Properties -

    private let controller: ApplicationController
    private lazy var logger = Logger(reporterType: Self.self)

    // MARK: - Init -

    init(controller: ApplicationController) {
        self.controller = controller
    }

    // MARK: - Public API -

    func didAppear() {
        self.logger.info("UI appeared")
    }

}
