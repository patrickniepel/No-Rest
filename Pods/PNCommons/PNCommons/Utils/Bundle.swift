//
//  Bundle.swift
//  PNCommons
//
//  Created by Patrick Niepel on 04.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

public extension Bundle {
    
    /**
     Returns a resource of type '.plist'
     - parameter identifier: The string identifier of the .plist resource. The default values is 'Info'
     - returns: The desired resource
     */
    func plist(identifier: String = "Info") -> NSDictionary? {
        if let path = path(forResource: identifier, ofType: "plist") {
            return NSDictionary(contentsOfFile: path)
        }
        return nil
    }
    
    /**
     Returns an entry within this bundle's 'Info.plist' file
     - parameter identifier: The string identifier of the Info.plist entry
     - returns: The desired entry value
     */
    func entryInInfoPlist(for key: String) -> Any? {
        if let plist = plist() {
            return plist[key]
        }
        return nil
    }
    
    /**
     Decodes json data represented by the specified class
     - parameter type: The desired class type that represents the json structure
     - parameter data: The desired json data to decode
     - returns: An object of the specified class containg the decoded json data
     */
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
