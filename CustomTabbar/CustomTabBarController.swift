//
//  CustomTabBarController.swift
//  CustomTabbar
//
//  Created by Harpreet on 13/05/25.
//

import UIKit

class CustomTabBarController: UITabBarController {

    let centerButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setValue(CustomTabBar(), forKey: "tabBar")
        self.tabBar.backgroundColor = .clear
        setupTabBar()
        setupCenterButton()
    }

    private func setupTabBar() {
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.backgroundColor = .clear
    }

    private func setupCenterButton() {
        centerButton.setImage(UIImage(named: "plus_icon"), for: .normal)
        centerButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(centerButton)
        NSLayoutConstraint.activate([
            centerButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            centerButton.centerYAnchor.constraint(equalTo: tabBar.topAnchor),
            centerButton.widthAnchor.constraint(equalToConstant: 84),
            centerButton.heightAnchor.constraint(equalToConstant: 84)
        ])

        centerButton.addTarget(self, action: #selector(centerButtonTapped), for: .touchUpInside)
    }

    @objc private func centerButtonTapped() {
        print("Center Button Pressed")
        // Present or push the desired view controller here
    }
}
