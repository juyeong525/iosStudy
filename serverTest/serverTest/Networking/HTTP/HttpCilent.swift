//
//  File.swift
//  serverTest
//
//  Created by 박주영 on 2022/05/31.
//

import Foundation

import Alamofire

protocol HTTPClientProvider {
    func get(url : String, params : Parameters?, header : HTTPHeaders) -> DataRequest
    func post(url : String, params : Parameters?, header : HTTPHeaders) -> DataRequest
    func delete(url : String, params : Parameters?, header : HTTPHeaders) -> DataRequest
}

class HTTPClient : HTTPClientProvider {
    func get(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest {
        return AF.request(baseURL + url,
                          method: .get,
                          parameters: params,
                          encoding: URLEncoding.default,
                          headers: header,
                          interceptor: nil)
    }
    
    func post(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest {
        return AF.request(baseURL + url,
                          method: .post,
                          parameters: params,
                          encoding: JSONEncoding.prettyPrinted,
                          headers: header,
                          interceptor: nil)
    }
    
    func delete(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest {
        return AF.request(baseURL + url,
                          method: .delete,
                          parameters: params,
                          encoding: JSONEncoding.prettyPrinted,
                          headers: header,
                          interceptor: nil)
    }
    
    let baseURL = "http://172.20.10.7:8000"
    
}
