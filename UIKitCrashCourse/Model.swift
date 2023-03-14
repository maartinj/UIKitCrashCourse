//
//  Model.swift
//  UIKitCrashCourse
//
//  Created by Marcin Jędrzejak on 14/03/2023.
//

import Foundation

struct UsersResponse: Codable {
    let data: [PersonResponse]
}

struct PersonResponse: Codable {
    let email: String
    let firstName: String
    let lastName: String
}
