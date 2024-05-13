//
//  ApplicationViewModel.swift
//  Yana
//
//  Created by Andrius Shiaulis on 12.05.2024.
//

import Foundation
import Combine
import OSLog

final class ApplicationViewModel {

    // MARK: - Properties -

    private let controller: ApplicationController
    private let coordinator: ApplicationCoordinator
    private let noteListViewModel: NoteListViewModel

    private lazy var logger = Logger(reporterType: Self.self)
    private var disposables = Set<AnyCancellable>()

    // MARK: - Init -

    init(controller: ApplicationController, coordinator: ApplicationCoordinator) {
        self.controller = controller
        self.coordinator = coordinator
        self.noteListViewModel = NoteListViewModel()

        bindCoordinator()
    }

    // MARK: - Public API -

    func didAppear() {
        self.logger.info("UI appeared")
    }

    func makeSidebarViewController() -> SidebarViewController {
        let viewModel = SidebarViewModel(coordinator: self.coordinator)
        return SidebarViewController(viewModel: viewModel)
    }

    func makeNoteListViewController() -> NoteListViewController {
        NoteListViewController(viewModel: self.noteListViewModel)
    }

    func makeNoteDetailsViewController() -> NoteDetailsViewController {
        let viewModel = NoteDetailsViewModel()
        return NoteDetailsViewController(viewModel: viewModel)
    }

    // MARK: - Private API -

    private func bindCoordinator() {
        self.coordinator.$selectedSidebarItem
            .sink { [weak self] item in
                guard let self else { return }
                self.handleSidebarItemSelection(item)
            }
            .store(in: &self.disposables)
    }

    private func handleSidebarItemSelection(_ item: SidebarViewModel.SidebarItem?) {
        switch item {
        case .none:
            self.noteListViewModel.showEmpty()
        case .inbox:
            self.noteListViewModel.showInbox()
        case .starred:
            self.noteListViewModel.showStarred()
        case .archive:
            self.noteListViewModel.showArchive()
        case .trash:
            self.noteListViewModel.showTrash()
        case .settings:
            assertionFailure("Not implemented yet")
        case .some(let unknownItem):
            assertionFailure("Unknown sidebar item \(unknownItem)")
        }
    }

}
