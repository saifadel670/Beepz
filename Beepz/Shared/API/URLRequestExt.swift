//
//  URLRequestExt.swift
//  Beepz
//
//  Created by Saif Adel on 27/01/2022.
//

import Foundation

extension URLRequest {
    static func requestWith<T:Decodable>(resource:Resource<T>)-> URLRequest{
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        print("url: \(resource.url)")
        request.addValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        return request
    }
}

enum HTTPHeaderField: String {
    case authentication  = "Authorization"
    case contentType     = "Content-Type"
    case acceptType      = "Accept"
    case acceptEncoding  = "Accept-Encoding"
    case acceptLangauge  = "Accept-Language"
}

enum ContentType: String {
    case json            = "application/json"
    case multipart       = "multipart/form-data"
    case ENUS            = "en-us"
}

