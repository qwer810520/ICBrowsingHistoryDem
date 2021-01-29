//
//  MainViewController.swift
//  ICBrowsingHistoryDemo
//
//  Created by Min on 2021/1/5.
//

import UIKit

class MainViewController: UIViewController {

  var testDataIsEmpty = false

  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupUserInterface()
    guard let tabbar = tabBarController as? TabbarController else { return }
    tabbar.isHidden = false
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    guard let tabbar = tabBarController as? TabbarController else { return }
    tabbar.isHidden = true
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)

  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    print("MainViewController ", #function)
  }

  // MARK: - Private Methods

  private func setupUserInterface() {
    view.backgroundColor = .systemPink
//    view.addSubview(browsingHistoryView)

    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Change Data Status", style: .plain, target: self, action: #selector(testButtonDidPressed))

    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "push", style: .plain, target: self, action: #selector(pushButtonDidPressed))
  }

  // MARK: - Action Methods

  @objc private func testButtonDidPressed() {
    testDataIsEmpty = !testDataIsEmpty
//    browsingHistoryView.frame.size.height = testDataIsEmpty ? 50 : UIScreen.main.bounds.height / 2
  }

  @objc private func pushButtonDidPressed() {
    let vc = NextViewController()
    navigationController?.pushViewController(vc, animated: true)
  }
}
