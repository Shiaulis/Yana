//
//  SceneDelegate.swift
//  Yana
//
//  Created by Andrius Shiaulis on 12.05.2024.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Properties -

    var window: UIWindow?

    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }

    // MARK: - UIWindowSceneDelegate -

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let viewModel = ApplicationViewModel(
            controller: self.appDelegate.applicationController,
            coordinator: self.appDelegate.applicationCoordinator
        )
        let viewController = ApplicationViewController(viewModel: viewModel)

        self.window = window

        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }

}

