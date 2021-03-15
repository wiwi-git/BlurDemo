//
//  MainViewController.swift
//  BlurDemo
//
//  Created by 위대연 on 2021/03/15.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var imageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let testView = UIView(frame: CGRect(origin: .zero, size: self.view.frame.size))
        self.view.addSubview(testView)
        testView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        if !UIAccessibility.isReduceTransparencyEnabled {
            let blurEffect = UIBlurEffect(style: .regular)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            //always fill the view
            blurEffectView.frame = testView.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            testView.addSubview(blurEffectView)
            //if you have more UIViews, use an insertSubview API to place it where needed
        } else {
            testView.backgroundColor = .black
        }
        
        let label = UILabel()
        testView.addSubview(label)
        label.text = "TEST"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        
        testView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        let safe = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            testView.topAnchor.constraint(equalTo: safe.topAnchor),
            testView.leadingAnchor.constraint(equalTo: safe.leadingAnchor),
            testView.trailingAnchor.constraint(equalTo: safe.trailingAnchor),
            testView.bottomAnchor.constraint(equalTo: safe.bottomAnchor),
            
            label.centerYAnchor.constraint(equalTo: safe.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: safe.centerXAnchor)
        ])
    }
    
    
    
}
