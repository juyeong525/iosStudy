//
//  TokenModel.swift
//  serverTest
//
//  Created by 박주영 on 2022/05/31.
//

import Foundation

struct TokenModel: Codable {
    let access_token: String
    let resfresh_token: String
}
