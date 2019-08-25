//
//  URLSessionClient.swift
//  ctwTest-Data
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import RxSwift
import ctwTest_Domain

public class URLSessionClient: NetworkDispatcher {
    private let session = URLSession(configuration: .default)
    
    let apiKey = "RVgCg1gEdfLHl0qnSYZG"
    let apiCode = "HkKjqdzJROe1IvQcN0he9w"
    
    public init() {}
    
    public func execute<T: APIRequest>(request: T) -> Single<T.Response> {
        guard var endpoint = URL(string: request.path) else { fatalError("APIRequest without a valid endpoint")}

        // Add the query string to the URL
        if let queryItems = request.queryItems,
            let urlWithQueryString = self.urlWithQueryItems(url: endpoint, newParams: queryItems),
            let urlWithGenericQueryString = self.addGenericQueryItems(url: urlWithQueryString) {
            endpoint = urlWithGenericQueryString
        }

        let result = Single<T.Response>.create { [weak self] event in
            var urlRequest = URLRequest(url: endpoint)
            urlRequest.httpMethod = request.method.rawValue
            
            
            // Setting the body
            if let bodyParams = request.bodyParams {
                urlRequest.httpBody = try? JSONEncoder().encode(bodyParams)
            }
            
            // Adding the headers
            if let headers = request.headers {
                for header in headers {
                    urlRequest.setValue(header.key, forHTTPHeaderField: header.value)
                }
            }
            
            // Performing the request
            let task = self?.session.dataTask(with: urlRequest) { data, response, error in
                if let data = data {
                    do {
                        
                        
                        if let error = error {
                            event(.error(error))
                        } else if let response = response as? HTTPURLResponse {
                            if 200...299 ~= response.statusCode {
                                
                                let netResponse = try JSONDecoder().decode(T.Response.self,
                                                                           from: data)
                                event(.success(netResponse))
                            } else {
                                event(.error(APIError.otherError))
                            }
                        } else {
                            event(.error(APIError.requestTimedOut))
                        }
                        
                    } catch {
                        print("Error parsing json \(String(describing: String(data: data, encoding: .utf8)))")
                        event(.error(APIError.jsonParsingError))
                    }
                } else if let error = error {
                    let errorCode = error as NSError
                    switch errorCode.code {
                    case NSURLErrorTimedOut:
                        event(.error(APIError.requestTimedOut))
                    case NSURLErrorServerCertificateUntrusted:
                        event(.error(APIError.invalidCertificate))
                    case NSURLErrorNotConnectedToInternet:
                        event(.error(APIError.noInternet))
                    default:
                        event(.error(APIError.otherError))
                    }
                }
                
            }
            task?.resume()
            return Disposables.create { task?.cancel() }
        }
        
        return result
    }
    
    func urlWithQueryItems(url: URL, newParams: [URLQueryItem]) -> URL? {
        if let urlComponents = NSURLComponents.init(url: url, resolvingAgainstBaseURL: false) {
            if (urlComponents.queryItems == nil) {
                urlComponents.queryItems = [];
            }
            urlComponents.queryItems?.append(contentsOf: newParams);
            return urlComponents.url;
        }
        return nil
    }
    
    func addGenericQueryItems(url: URL) -> URL? {
        var genericItems = [URLQueryItem]()
        genericItems.append(URLQueryItem(name: "app_id", value: apiKey))
        genericItems.append(URLQueryItem(name: "app_code", value: apiCode))
        return urlWithQueryItems(url: url, newParams: genericItems)
        
    }
    
}
