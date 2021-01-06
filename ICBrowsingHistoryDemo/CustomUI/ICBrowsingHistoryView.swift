//
//  ICBrowsingHistoryView.swift
//  ICBrowsingHistoryDemo
//
//  Created by Min on 2021/1/5.
//

import UIKit

class ICBrowsingHistoryView: UIView {

  private var isDrag = false
  private var tabbarY: CGFloat

  private var dragRange: (minY: CGFloat, maxY: CGFloat) {
    return (tabbarY - bounds.height, tabbarY - 10)
  }

  private var touchBeganY: CGFloat = 0

  lazy private var scrollItem: UIButton = {
    let button = UIButton(type: .system)
    let height: CGFloat = 30
    button.frame = CGRect(x: 15, y: bounds.minY - height, width: 120, height: height)
    button.backgroundColor = .white
    button.setTitle("瀏覽紀錄", for: .normal)
    button.setTitleColor(.lightGray, for: .normal)
    button.isEnabled = false
    return button
  }()

  // MARK: - Initialization

  init(tabbarY: CGFloat, origin: CGPoint) {
    let screenSize: CGSize = UIScreen.main.bounds.size
    self.tabbarY = tabbarY
    super.init(frame: .init(origin: origin, size: .init(width: screenSize.width, height: screenSize.height / 2)))
    setupUserInterface()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
  }

  override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
    for subview in subviews where !subview.isHidden && subview.isUserInteractionEnabled && subview.point(inside: convert(point, to: subview), with: event) {
        return true
    }
    return false
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    print("ICBrowsingHistoryView ", #function)
    touchBeganY = frame.origin.y
  }

  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesMoved(touches, with: event)
    guard let touch = touches.first, let parentView = superview else { return }
    let y = touch.location(in: parentView).y
    guard y >= dragRange.minY && y <= dragRange.maxY else { return }
    frame.origin.y = y
  }

  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    print("ICBrowsingHistoryView ", #function)
    guard let touch = touches.first else { return }
    let viewFrameY: CGFloat = frame.origin.y
    print("frame.origin.y: \(frame.origin.y)")
    print("range; \(dragRange)")
    print("touch.location(in: scrollItem): \(touch.location(in: scrollItem))")

    if viewFrameY == dragRange.minY {
      print("viewFrameY == dragRange.minY")
      dismissAnimation()
      print("========================================================>")
      return
    }

    if viewFrameY == dragRange.maxY {
      print("viewFrameY == dragRange.maxY")
      presentAnimation()
      print("========================================================>")
      return
    }

    if viewFrameY > touchBeganY  {
      print("viewFrameY > touchBeganY")
      dismissAnimation()
    } else {
      print("Other result")
      presentAnimation()
    }
    print("========================================================>")
  }

  // MARK: - Private Methods

  private func setupUserInterface() {
    backgroundColor = .white
    addSubview(scrollItem)
    isUserInteractionEnabled = true
  }

  private func presentAnimation() {
    UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: []) { [weak self] in
      guard let self = self else { return }
      self.frame.origin.y = self.dragRange.minY
      self.scrollItem.setTitleColor(.systemOrange, for: .normal)
    } completion: { [weak self] _ in
      self?.isDrag = true
    }
  }

  private func dismissAnimation() {
    UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: []) { [weak self] in
      guard let self = self else { return }
      self.frame.origin.y = self.dragRange.maxY
      self.scrollItem.setTitleColor(.lightGray, for: .normal)
    } completion: { [weak self] _ in
      self?.isDrag = false
    }
  }
}
