//
//  SearchModel.swift
//  mitjip
//
//  Created by 박주영 on 2022/06/09.
//

import Foundation

struct SearchModel: Codable {
    var index: Int = .init()
    var title: String = .init()
    var category: String = .init()
    var address: String = .init()
    var roadAddress: String = .init()
    var homePageLink: String = .init()
    var imageLink: String = .init()
}
