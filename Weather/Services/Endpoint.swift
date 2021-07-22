//
//  Endpoint.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 19/07/21.
//

import Alamofire

struct Endpoint<Decodable> {

    let path: String
    let method: HTTPMethod
    let parameters: Parameters?
    var dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .secondsSince1970
    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .convertFromSnakeCase
    var encoding: ParameterEncoding {
        method == .post ? JSONEncoding.default : URLEncoding.default
    }
}

extension Endpoint {

    var weatherUrl: URL {

        var components = URLComponents()
        components.scheme = config.httpScheme
        components.host = config.host
        components.path = config.path
        return components.url!
    }
}

extension Endpoint {

    static func oneCall(forlat lat: Double, lon: Double) -> Endpoint<OneCallResponse> {
        Endpoint<OneCallResponse>(
            path: "/onecall",
            method: .get,
            parameters: [
                "appid": config.appid,
                "lat": lat,
                "lon": lon,
                "exclude": "minutely",
                "units": "metric"
            ]
        )
    }
}
