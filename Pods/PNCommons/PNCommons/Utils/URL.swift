//
//  URL.swift
//  PNCommons
//
//  Created by Patrick Niepel on 04.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

public extension URL {
    
    /**
     Adds the desired parameters to this url instance
     - parameter parameters: The dictionary of parameters to add to this url instance
     - returns: The url including the parameters 
     */
    func add(parameters: [String: String]) -> URL {
        if var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false) {
            
            var queryItems = (urlComponents.queryItems ?? [URLQueryItem]())
            
            for (key, value) in parameters {
                queryItems.append(URLQueryItem(name: key, value: "\(value)"))
            }
            
            urlComponents.queryItems = queryItems
            
            if let url = urlComponents.url {
                return url
            } else {
                return self
            }
        }
        return self
    }
    
    /**
     Adds the desired fragment to this url instance
     - parameter fragment: The fragment to add to this url instance
     - returns: The url including the fragment
     */
    func add(fragment: String) -> URL {
        if var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false) {
            
            urlComponents.fragment = fragment
            
            if let url = urlComponents.url {
                return url
            } else {
                return self
            }
        }
        return self
    }
}



