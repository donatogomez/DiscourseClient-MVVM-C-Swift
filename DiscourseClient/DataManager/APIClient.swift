//
//  APIClient.swift
//  DiscourseClient
//
//  Created by Donato Gómez Carrillo on 20/12/21.
//

import Foundation

enum APIClientError: Error {
    case httpError(Int)
    case apiError(APIError)
}

final class APIClient {
    var session = URLSession(configuration: .default)
    
    func request<T: APIRequest>(request: T, completion: @escaping(Result<T.Response?, Error>) -> ()) {
        DispatchQueue.global(qos: .background).async {
            
            let request = request.requestWithBaseURL()
            
            let task = self.session.dataTask(with: request) { data, response, error in
                
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 400 && httpResponse.statusCode <= 500 {
                    if let data = data {
                        do {
                            let errorModel = try JSONDecoder().decode(APIError.self, from: data)
                            DispatchQueue.main.async {
                                completion(.failure(APIClientError.apiError(errorModel)))
                            }
                        } catch {
                            DispatchQueue.main.async {
                                completion(.failure(error))
                            }
                        }
                    } else {
                        DispatchQueue.main.async {
                            completion(.failure(APIClientError.httpError(httpResponse.statusCode)))
                        }
                    }
                    return
                }
                
                if let data = data, !data.isEmpty {
                    do {
                        let responseModel = try JSONDecoder().decode(T.Response.self, from: data)
                        DispatchQueue.main.async {
                            completion(.success(responseModel))
                        }
                    } catch {
                        DispatchQueue.main.async {
                            completion(.failure(error))
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(.success(nil))
                    }
                }
            }
            
            task.resume()
        }
    }
}

struct APIError: Codable {
    let action: String?
    let errors: [String]?
}
