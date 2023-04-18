//
//  NetworkManager.swift
//  NihilentAssignment
//
//  Created by Narendra Satpute on 17/04/23.
//

import Foundation

protocol NetworkManagerProtocol: AnyObject {
    func executeRequest<T: Decodable>(url: URLRequest, completion: @escaping (Result<T, Error>) -> Void)
}

enum HttpErrors: Error {
    case invalidResponse
    case invalidStatusCode(Int)
    case invalidRequest(Error)
    case decodingError
}

class NetworkManager: NetworkManagerProtocol {
    
    let httpOkStatusCode = 200
    static let shared = NetworkManager()
    private init() {}
    let imageStorage = ImageStorage()

    
    enum HttpMethod: String {
        case get
        case post
        case put
        case delete
        
        var method: String { rawValue.uppercased() }
    }
    
    
    func executeRequest<T: Decodable>(url: URLRequest, completion: @escaping (Result<T, Error>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            
            guard error == nil else {
                completion(.failure(HttpErrors.invalidRequest(error!)))
                return
            }
            let httpResponse = response as? HTTPURLResponse
            if httpResponse?.statusCode == self.httpOkStatusCode, let responseData = data {
                do {
                    let result = try JSONDecoder().decode(T.self, from: responseData)
                    completion(.success(result))
                } catch {
                    completion(.failure(HttpErrors.decodingError))
                }
                
            } else {
                completion(.failure(HttpErrors.invalidResponse))
            }
        })
        task.resume()
    }
    
    
    func loadImage(fromUrl request: URLRequest) async -> Data? {
        do {
            let (responseData, serverUrlResponse) = try await URLSession.shared.data(for: request)
            guard let httpResponse = serverUrlResponse as? HTTPURLResponse else {
                return nil
            }
            
            if httpResponse.statusCode == httpOkStatusCode {
                return responseData
            } else {
                return nil
            }
            
        } catch {
            return nil
        }
    }
}
