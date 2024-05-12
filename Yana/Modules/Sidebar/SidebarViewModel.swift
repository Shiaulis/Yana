//
//  SidebarViewModel.swift
//  Yana
//
//  Created by Andrius Shiaulis on 12.05.2024.
//

import Foundation

final class SidebarViewModel {

    struct SidebarItem: Hashable {

        enum SidebarItemType {
            case collection, button
        }

        let title: String
        let icon: String
        let type: SidebarItemType

        static let inbox = SidebarItem(title: "Inbox", icon: "tray.fill", type: .collection)
        static let starred = SidebarItem(title: "Starred", icon: "star.fill", type: .collection)
        static let archive = SidebarItem(title: "Archive", icon: "archivebox.fill", type: .collection)
        static let trash = SidebarItem(title: "Trash", icon: "trash.fill", type: .collection)
        static let settings = SidebarItem(title: "Settings", icon: "gear", type: .button)

    }

    let items: [SidebarItem] = [.inbox, .starred, .archive, .trash, .settings]

}
