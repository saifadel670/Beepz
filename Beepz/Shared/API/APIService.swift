//
//  APIService.swift
//  Beepz
//
//  Created by Saif Adel on 27/01/2022.
//

import RxSwift
import RxCocoa

enum HttpMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

struct Resource<T: Codable> {
    let url: URL
    var httpMethod: HttpMethod = .get
    var jwt: String?
    var body: Data? = nil
}

enum ApiResult<T> {
    case success(T)
    case failure(ApiError)
}

enum ApiError: Error {
    case unknownError
    case notFound
    case serverError
    case parsingError
    case BadRequest // the server cannot or will not process the request.
    case authorizationError(Data)
}

class APIService {
    
    static func load<T:Codable>(resource: Resource<T>) -> Observable<(ApiResult<T>)> {
        
        return Observable.just(resource.url)
            .flatMap { url -> Observable<(response: HTTPURLResponse, data: Data)> in
                
                return URLSession.shared.rx.response(request: URLRequest.requestWith(resource: resource))
            }.map { response,data -> (ApiResult<T>) in
              
                switch response.statusCode {
                 
                case 200...300:
                    do {
                        let data = try JSONDecoder().decode(T.self, from: data)
                        
                        return ApiResult.success(data)
                    } catch ( let error ) {
                        print("unknown error: \(error)")
                        return ApiResult.failure(.unknownError)
                    }                case 400:
                    return ApiResult.failure(.BadRequest)
                case 401:
                    return ApiResult.failure(.authorizationError(data))
                case 402...499:
                    return ApiResult.failure(.notFound)
                case 500...599:
                    return ApiResult.failure(.serverError)
                default:
                    return .failure(.unknownError)
                }
            }
    }
}

struct JsonString {
    static func convertResponseToJsonString( _ url:String, _ data: Data){
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                print(url)
                print("JSON:- \(json)")
            }
        } catch let error as NSError {
            print("Failed to load JSON:-  \(error.localizedDescription)")
        }
     }
}

