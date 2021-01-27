//
//  TabbarController.swift
//  ICBrowsingHistoryDemo
//
//  Created by Min on 2021/1/5.
//

import UIKit

class TabbarController: UITabBarController {

  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()
    setupTabbarItem()

    print(tabBar.frame.minY)
  }

  // MARK: - Private Methods

  private func setupTabbarItem() {
    let baseController = UINavigationController(rootViewController: MainViewController())
    baseController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
    viewControllers = [baseController]
  }
}
