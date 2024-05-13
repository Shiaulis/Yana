//
//  ApplicationCoordinator.swift
//  Yana
//
//  Created by Andrius Shiaulis on 13.05.2024.
//

import Foundation

final class ApplicationCoordinator {

    @Published var selectedSidebarItem: SidebarViewModel.SidebarItem?

    func open(_ sidebarItem: SidebarViewModel.SidebarItem) {
        self.selectedSidebarItem = sidebarItem
    }

}
