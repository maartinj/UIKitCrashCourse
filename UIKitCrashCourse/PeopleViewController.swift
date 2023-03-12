//
//  PeopleViewController.swift
//  UIKitCrashCourse
//
//  Created by Marcin Jędrzejak on 10/03/2023.
//

import UIKit

class PeopleViewController: UIViewController {
    
    private lazy var personVw: PersonView = {
        
        let vw = PersonView { [weak self] in
            self?.sayHello()
        }
        return vw
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
        
        self.view.addSubview(personVw)
        
        NSLayoutConstraint.activate([
            personVw.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            personVw.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            personVw.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
    }
    
    func sayHello() {
        print("Hiya")
    }
}
