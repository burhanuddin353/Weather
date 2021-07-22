//
//  WeatherService.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 19/07/21.
//

import Alamofire

enum ServiceError: Error {

    case invalidResponse
    case invalidUrl
    case custom(String)
}

extension ServiceError: LocalizedError {

    var errorDescription: String? {

        switch self {

        case .invalidResponse,
             .invalidUrl:
            return "Something went wrong"

        case .custom(let message):
            return message
        }
    }
}

typealias Handler<T: Decodable> = (Result<T, Error>) -> Void

class OWService {

    static func request<T: OWResponse>(for endpoint: Endpoint<T>,
                                      then handler: @escaping Handler<T>) {

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = endpoint.keyDecodingStrategy
        decoder.dateDecodingStrategy = endpoint.dateDecodingStrategy

        let url = endpoint.weatherUrl.appendingPathComponent(endpoint.path)
        
        AF.request(url,
                   method: endpoint.method,
                   parameters: endpoint.parameters,
                   encoding: endpoint.encoding)
            .responseDecodable(of: T.self, decoder: decoder) { response in

                guard let value = response.value else {
                    handler(.failure(response.error!))
                    return
                }

                guard value.errorMessage == nil else {
                    handler(.failure(ServiceError.custom(value.errorMessage!)))
                    return
                }

                handler(.success(value))
            }
    }
}
