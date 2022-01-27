//
//  Api+URL.swift
//  Beepz
//
//  Created by Saif Adel on 27/01/2022.
//

import Foundation

class Api {
    enum BaseURL : String {
        case flickr = "https://beepz.ae"
    }
    
    static func getUrl(baseURL: BaseURL, endPoint: String) -> URL?{
        return URL(string: baseURL.rawValue + endPoint)
    }
}

extension URL {
    static let services = Api.getUrl(baseURL: .flickr, endPoint: "/api/v1/Get/Customer/active/request")
}

extension URL {
    
    mutating func appendQueryItem(name: String, value: String?) {
        guard var urlComponents = URLComponents(string: absoluteString) else { return }
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []
        let queryItem = URLQueryItem(name: name, value: value)
        queryItems.append(queryItem)
        urlComponents.queryItems = queryItems
        self = urlComponents.url!
    }
}
