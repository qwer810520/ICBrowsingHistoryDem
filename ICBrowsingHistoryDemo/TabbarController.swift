//
//  TabbarController.swift
//  ICBrowsingHistoryDemo
//
//  Created by Min on 2021/1/5.
//

import UIKit

class TabbarController: UITabBarController {

  private(set) var tabbarMinY: CGFloat = 0

  lazy private var browsingHistoryView: ICBrowsingHistoryView = {
    let y: CGFloat = tabbarMinY - 10
    return ICBrowsingHistoryView(tabbarY: tabbarMinY, origin: .init(x: 0, y: y))
  }()

  lazy private var testBackView: UIView = {
    let view = UIView(frame: tabBar.bounds)
    view.backgroundColor = .lightGray
    return view
  }()

  // MARK: - UIViewController

  var isHidden: Bool {
    get { !(tabBar.frame.minY == tabbarMinY) }
    set(newValue) {
      switch newValue {
        case true:
          tabBar.frame.origin.y = UIScreen.main.bounds.height
          browsingHistoryView.frame.origin.y = UIScreen.main.bounds.height + 100
        case false:
          tabBar.frame.origin.y = tabbarMinY
          browsingHistoryView.frame.origin.y = tabbarMinY - 10
      }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    tabbarMinY = tabBar.frame.minY
    setupTabbarItem()
    setupUserInterface()
  }

  // MARK: - Private Methods

  private func setupUserInterface() {
    print(view.frame)
    print("tabbarMinY: \(tabbarMinY)")
    view.insertSubview(browsingHistoryView, belowSubview: tabBar)
//    tabBar.insertSubview(browsingHistoryView, at: 0)
//    tabBar.insertSubview(testBackView, aboveSubview: browsingHistoryView)

    delegate = self
  }

  private func setupTabbarItem() {
    let baseController = UINavigationController(rootViewController: MainViewController())
    baseController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
    viewControllers = [baseController]
  }
}

  // MARK: - UITabBarControllerDelegate

extension TabbarController: UITabBarControllerDelegate {
  override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    print(#function)
  }
}
