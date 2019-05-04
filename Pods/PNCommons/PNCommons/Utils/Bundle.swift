//
//  Bundle.swift
//  PNCommons
//
//  Created by Patrick Niepel on 04.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

public extension Bundle {
    
    func plist(identifier: String = "Info") -> NSDictionary? {
        if let path = path(forResource: identifier, ofType: "plist") {
            return NSDictionary(contentsOfFile: path)
        }
        return nil
    }
    
    func entryInInfoPlist(for key: String) -> Any? {
        if let plist = plist() {
            return plist[key]
        }
        return nil
    }
    
    func decodeJson<T: Decodable>(type: T.Type, from data: Data) -> T {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let result = try jsonDecoder.decode(type, from: data)
            return result
        }
        catch(let error) {
            fatalError(error.localizedDescription)
        }
    }
}
