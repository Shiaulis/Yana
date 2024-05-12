//
//  ApplicationViewController.swift
//  Yana
//
//  Created by Andrius Shiaulis on 12.05.2024.
//

import UIKit

final class ApplicationViewController: UISplitViewController {

    // MARK: - Properties -

    private let viewModel: ApplicationViewModel

    // MARK: - Init -

    init(viewModel: ApplicationViewModel) {
        self.viewModel = viewModel
        super.init(style: .tripleColumn)

        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Controller Lifecycle -

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel.didAppear()
    }

    // MARK : Private API -

    private func setup() {
        let sidebar = self.viewModel.makeSidebarViewController()
        setViewController(sidebar, for: .primary)

        let noteList = self.viewModel.makeNoteListViewController()
        setViewController(noteList, for: .supplementary)

        let noteDetails = self.viewModel.makeNoteDetailsViewController()
        setViewController(noteDetails, for: .secondary)

        self.preferredSplitBehavior = .tile
        self.preferredDisplayMode = .twoBesideSecondary
    }

}

