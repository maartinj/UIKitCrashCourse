//
//  PeopleViewController.swift
//  UIKitCrashCourse
//
//  Created by Marcin Jędrzejak on 10/03/2023.
//

import UIKit

class PeopleViewController: UIViewController {
    
    private lazy var subscribeBtn: UIButton = {
        
        var config = UIButton.Configuration.filled()
        config.title = "Subscribe".uppercased()
        config.baseBackgroundColor = .red
        config.baseForegroundColor = .white
        config.buttonSize = .large
        config.cornerStyle = .medium
        
        let btn = UIButton(configuration: config)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Ya boys in mem!")
        setup()
    }
}

private extension PeopleViewController {
    
    func setup() {
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(subscribeBtn)
        
        NSLayoutConstraint.activate([
            subscribeBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            subscribeBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
