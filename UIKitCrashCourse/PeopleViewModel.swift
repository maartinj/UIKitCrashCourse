//
//  PeopleViewModel.swift
//  UIKitCrashCourse
//
//  Created by Marcin Jędrzejak on 14/03/2023.
//

import Foundation

class PeopleViewModel {
    
    private var people = [PersonResponse]()
    
    func getUsers() {
        
        Task { [weak self] in
            
            do {
                let url = URL(string: "https://reqres.in/api/users")!
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                
                self?.people = try jsonDecoder.decode(UsersResponse.self, from: data).data
            } catch {
                print(error)
            }
        }
    }
}
