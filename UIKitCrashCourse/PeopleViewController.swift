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
        btn.addTarget(self, action: #selector(didTapSubscribe), for: .touchUpInside)
        return btn
    }()
    
    private lazy var personContainerVw: UIView = {
        
        let vw = UIView()
        vw.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    private lazy var nameLbl: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Billy Bob"
        lbl.font = .systemFont(ofSize: 24, weight: .bold)
        return lbl
    }()
    
    private lazy var emailLbl: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "billy.bob@gmail.com"
        lbl.font = .systemFont(ofSize: 15, weight: .regular)
        return lbl
    }()
    
    private lazy var personStackVw: UIStackView = {
        
        let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .vertical
        vw.spacing = 8
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
        
        self.view.addSubview(personContainerVw)
        
        personContainerVw.addSubview(personStackVw)
        
        personStackVw.addArrangedSubview(nameLbl)
        personStackVw.addArrangedSubview(emailLbl)
        personStackVw.addArrangedSubview(subscribeBtn)
        
        NSLayoutConstraint.activate([
            personContainerVw.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            personContainerVw.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            personContainerVw.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            personStackVw.topAnchor.constraint(equalTo: personContainerVw.topAnchor, constant: 8),
            personStackVw.bottomAnchor.constraint(equalTo: personContainerVw.bottomAnchor, constant: -8),
            personStackVw.leadingAnchor.constraint(equalTo: personContainerVw.leadingAnchor, constant: 8),
            personStackVw.trailingAnchor.constraint(equalTo: personContainerVw.trailingAnchor, constant: -8)
        ])
    }
    
    @objc func didTapSubscribe(sender: UIButton) {
        print("I'm subscribing")
    }
}
