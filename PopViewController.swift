//
//  PopViewController.swift
//  PopViewProject
//
//  Created by Gamid Gapizov on 13.02.2024.
//

import UIKit

class PopViewController: UIViewController {
    
    var segmentC = UISegmentedControl()
    let array = ["280pt", "150pt"]
    let closeButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        view.frame = .init(x: 0, y: 0, width: 300, height: 280)
        
        segmentC = UISegmentedControl(items: array)
        segmentC.selectedSegmentIndex = 0
        segmentC.frame = .init(x: 100, y: 30, width: 100, height: 40)
        segmentC.addTarget(self, action: #selector(sizeChanged(sender:)), for: .valueChanged)
        view.addSubview(segmentC)
        
        closeButton.frame = .init(x: 250, y: 30, width: 40, height: 40)
        closeButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        closeButton.backgroundColor = .systemGray3
        closeButton.tintColor = .systemGray5
        closeButton.layer.cornerRadius = closeButton.frame.size.width / 2
        closeButton.imageView?.contentMode = .scaleAspectFill
        view.addSubview(closeButton)
    }    
    
    @objc func sizeChanged(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "size280pt"), object: nil)
        } else if sender.selectedSegmentIndex == 1 {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "size150pt"), object: nil)
        }
        
        print("notification sended")
    }
}
