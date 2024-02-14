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
    var closeButton = UIBarButtonItem()

    override func loadView() {
        super.loadView()
        view.backgroundColor = .systemGray5
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentC = UISegmentedControl(items: array)
        segmentC.selectedSegmentIndex = 0
        segmentC.frame = .init(x: 0, y: 0, width: 100, height: 35)
        segmentC.addTarget(self, action: #selector(sizeChanged(sender:)), for: .valueChanged)
        
        closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closePressed))
        navigationItem.rightBarButtonItem = closeButton
        
        self.navigationItem.titleView = segmentC
    }
    
    @objc func sizeChanged(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "size280pt"), object: nil)
        } else if sender.selectedSegmentIndex == 1 {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "size150pt"), object: nil)
        }
        
        print("notification sended")
    }
    
    @objc func closePressed() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "closeView"), object: nil)
    }
}
