//
//  NoteListViewController.swift
//  Yana
//
//  Created by Andrius Shiaulis on 12.05.2024.
//

import Foundation
import UIKit

final class NoteListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        self.title = "Notes"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
