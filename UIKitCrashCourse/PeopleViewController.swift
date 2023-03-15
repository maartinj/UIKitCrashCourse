//
//  PeopleViewController.swift
//  UIKitCrashCourse
//
//  Created by Marcin Jędrzejak on 10/03/2023.
//

// Film 1:22:18

import UIKit

class PeopleViewController: UIViewController {
    
    private let vm = PeopleViewModel()
    
    private lazy var cv: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: UIScreen.main.bounds.width, height: 130)
        
        let vw = UICollectionView(frame: .zero, collectionViewLayout: layout)
        vw.register(PersonCollectionViewCell.self, forCellWithReuseIdentifier: "PersonCollectionViewCell")
        vw.dataSource = self
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Ya boys in mem!")
        setup()
        vm.getUsers()
    }
}

extension PeopleViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vm.people.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCollectionViewCell",
                                                      for: indexPath) as! PersonCollectionViewCell
        return cell
    }
    
    
}

private extension PeopleViewController {
    
    func setup() {
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(cv)
        
        NSLayoutConstraint.activate([
            
            cv.topAnchor.constraint(equalTo: view.topAnchor),
            cv.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cv.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cv.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
