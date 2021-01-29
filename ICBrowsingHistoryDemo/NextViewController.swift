//
//  ViewController.swift
//  ICBrowsingHistoryDemo
//
//  Created by Min on 2021/1/5.
//

import UIKit

class NextViewController: UIViewController {

  lazy private var toolBar: UIToolbar = {
    let toolBar = UIToolbar()
    toolBar.translatesAutoresizingMaskIntoConstraints = false
    return toolBar
  }()

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    hidesBottomBarWhenPushed = true
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupUserInterface()
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    navigationController?.popViewController(animated: true)
  }

  // MARK: - Private Methods

  private func setupUserInterface() {
    view.backgroundColor = .systemBlue
    view.addSubview(toolBar)

    view.addConstraints(NSLayoutConstraint.constraints(
                          withVisualFormat: "H:|[toolBar]|",
                          options: [],
                          metrics: nil,
                          views: ["toolBar": toolBar]))

    view.addConstraints(NSLayoutConstraint.constraints(
                          withVisualFormat: "V:[toolBar]|",
                          options: [],
                          metrics: nil,
                          views: ["toolBar": toolBar]))
  }
}

