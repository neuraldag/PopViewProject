//
//  ViewController.swift
//  PopViewProject
//
//  Created by Gamid Gapizov on 13.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let presentButton = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        createButton()
        
        NotificationCenter.default.addObserver(self, selector: #selector(size150), name: NSNotification.Name(rawValue: "size150pt"), object: popoverPresentationController)
        NotificationCenter.default.addObserver(self, selector: #selector(size280), name: NSNotification.Name(rawValue: "size280pt"), object: popoverPresentationController)
        NotificationCenter.default.addObserver(self, selector: #selector(closePop), name: NSNotification.Name(rawValue: "closeView"), object: popoverPresentationController)
    }
    
    
    
    func createButton() {
        view.addSubview(presentButton)
        presentButton.setTitle("Present", for: .normal)
        presentButton.setTitleColor(.systemCyan, for: .highlighted)
        presentButton.setTitleColor(.systemBlue, for: .normal)
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        presentButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    
    
    @objc func buttonTapped(sender: UIButton) {
        let popOVC = UINavigationController(rootViewController: PopViewController())
        popOVC.modalPresentationStyle = .popover
        popOVC.preferredContentSize = .init(width: 300, height: 280-44)
        
        guard let presentationVC = popOVC.popoverPresentationController else { return }
        presentationVC.delegate = self
        presentationVC.sourceView = sender
        presentationVC.permittedArrowDirections = .up
        presentationVC.sourceRect = .init(x: sender.bounds.midX,
                                          y: sender.bounds.maxY,
                                          width: 0, height: 0)
        
        present(popOVC, animated: true)
        
        print("popped")
    }
    
    
    
    @objc func closePop() { presentedViewController?.dismiss(animated: true) }
    @objc func size150() {
        presentedViewController?.preferredContentSize = .init(width: 300, height: 150-44)
        print("PopOver width: \(presentedViewController?.preferredContentSize.width), height: \(presentedViewController?.preferredContentSize.height)")
    }
    @objc func size280() {
        presentedViewController?.preferredContentSize = .init(width: 300, height: 280-44)
        print("PopOver width: \(presentedViewController?.preferredContentSize.width), height: \(presentedViewController?.preferredContentSize.height)")
    }
}


extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle { .none }
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle { .none }
    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool { false }
}
