//
//  NoteDetailsViewController.swift
//  Yana
//
//  Created by Andrius Shiaulis on 12.05.2024.
//

import Foundation
import UIKit

final class NoteDetailsViewController: UIViewController {

    // MARK: - Properties -

    private let viewModel: NoteDetailsViewModel

    // MARK: - Init -

    init(viewModel: NoteDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Controller Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
    }
}
