//
//  UserResponse.swift
//  VkNewsFeed
//
//  Created by Максим Лебедев on 28.10.2021.
//

import Foundation


struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
    
}

struct UserResponse: Decodable {
    let photo100: String?
}
