//
//  AuthAPI.swift
//  DSMTogtherBuying
//
//  Created by 박주영 on 2022/07/07.
//

import Foundation

enum AuthAPI : API {
    case login
    case signup
    case emailCheck
    
    func path() -> String {
        switch self {
        case .login :
            return "/signin"
        case .signup:
            return "/signup"
        case .emailCheck :
            return "/email"
        }
    }
}
