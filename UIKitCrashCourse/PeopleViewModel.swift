//
//  PeopleViewModel.swift
//  UIKitCrashCourse
//
//  Created by Marcin Jędrzejak on 14/03/2023.
//

import Foundation

protocol PeopleViewModelDelegate: AnyObject {
    func didFinish()
    func didFail(error: Error)
}

class PeopleViewModel {
    
    private(set) var people = [PersonResponse]()
    
    weak var delegate: PeopleViewModelDelegate?
    
    func getUsers() {
        
        Task { [weak self] in
            
            do {
                let url = URL(string: "https://reqres.in/api/users")!
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                
                self?.people = try jsonDecoder.decode(UsersResponse.self, from: data).data
                self?.delegate?.didFinish()
                
            } catch {
                
                self?.delegate?.didFail(error: error)
            }
        }
    }
}
