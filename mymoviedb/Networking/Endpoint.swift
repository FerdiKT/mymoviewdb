//
//  Endpoint.swift
//  mymoviedb
//
//  Created by Ferdi Kızıltoprak on 29.11.2020.
//

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "dummyapi.io"
        components.path = "/data/api" + path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
    
    var headers: [String: Any] {
        return [
            "app-id": "b8E57Ts56PBNGbF4fvCP"
        ]
    }
}

extension Endpoint {
    static var users: Self {
        return Endpoint(path: "/user")
    }
    
    static func users(count: Int) -> Self {
        return Endpoint(path: "/user",
                        queryItems: [
                            URLQueryItem(name: "limit",
                                         value: "\(count)")
            ]
        )
    }
    
    static func user(id: String) -> Self {
        return Endpoint(path: "/user/\(id)")
    }
}
