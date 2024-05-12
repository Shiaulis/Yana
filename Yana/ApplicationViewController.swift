//
//  ApplicationViewController.swift
//  Yana
//
//  Created by Andrius Shiaulis on 12.05.2024.
//

import UIKit

final class ApplicationViewController: UIViewController {

    // MARK: - Properties -

    private let viewModel: ApplicationViewModel

    // MARK: - Init -

    init(viewModel: ApplicationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Controller Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .orange
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel.didAppear()
    }

}

