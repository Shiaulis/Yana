//
//  SidebarViewController.swift
//  Yana
//
//  Created by Andrius Shiaulis on 12.05.2024.
//

import Foundation
import UIKit

final class SidebarViewController: UICollectionViewController {

    // MARK: - Types -
    private enum Section { case main }
    private typealias Item = SidebarViewModel.SidebarItem
    private typealias SectionSnapshot = NSDiffableDataSourceSectionSnapshot<Item>
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>

    // MARK: - Properties -

    private let viewModel: SidebarViewModel
    private lazy var dataSource = makeDataSource()

    // MARK: - Init -

    init(viewModel: SidebarViewModel) {
        self.viewModel = viewModel

        let configuration = UICollectionLayoutListConfiguration(appearance: .sidebar)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        super.init(collectionViewLayout: layout)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Controller Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.prefersLargeTitles = true
        populateInitialSnapshot()
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.viewModel.didSelectItem(at: indexPath.row)
    }

    // MARK: - Private API -

    private func populateInitialSnapshot() {
        var sectionSnapshot = SectionSnapshot()
        sectionSnapshot.append(viewModel.items)
        self.dataSource.apply(sectionSnapshot, to: .main, animatingDifferences: false)
    }

    private func makeDataSource() -> DataSource {
        let sidebarItemCellRegistration = makeSidebarItemCellRegistration()
        return DataSource(collectionView: self.collectionView) {
            collectionView, indexPath, item -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(
                using: sidebarItemCellRegistration, for: indexPath, item: item)
        }
    }

    private func makeSidebarItemCellRegistration() ->
    UICollectionView.CellRegistration<UICollectionViewListCell, Item> {
        return .init { cell, _, item in
            var content = cell.defaultContentConfiguration()
            content.text = item.title
            content.image = UIImage(systemName: item.icon)
            cell.contentConfiguration = content
            cell.accessories = [.disclosureIndicator()]
        }
    }

}
