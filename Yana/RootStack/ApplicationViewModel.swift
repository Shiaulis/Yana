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

    func makeSidebarViewController() -> SidebarViewController {
        let viewModel = SidebarViewModel()
        return SidebarViewController(viewModel: viewModel)
    }

    func makeNoteListViewController() -> NoteListViewController {
        let viewModel = NoteListViewModel()
        return NoteListViewController(viewModel: viewModel)
    }

    func makeNoteDetailsViewController() -> NoteDetailsViewController {
        let viewModel = NoteDetailsViewModel()
        return NoteDetailsViewController(viewModel: viewModel)
    }

}
