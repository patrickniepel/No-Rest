//
//  FileController.swift
//  NoRest
//
//  Created by Patrick Niepel on 01.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

struct FileController {
    
    static let fileName = NRConstants.DataIdentifiers.fileName
    static let dataKey = NRConstants.DataIdentifiers.userDataKey
    
    static func loadData() -> UserData? {
        return decodeDataObject()
    }
    
    static func storeData(data: UserData) {
        encodeDataObject(dataObject: data)
    }
    
    private static func decodeDataObject() -> UserData? {
        
        let decoder = PropertyListDecoder()
        do {
            if let data = unarchiveDataObject() {
                let decodedData = try decoder.decode(UserData.self, from: data)
                return decodedData
            }
        } catch(let error) {
            log.error(error.localizedDescription)
        }
        
        return nil
    }
    
    private static func unarchiveDataObject() -> Data? {
        var item : Data?
        let file = dataFileForName(fileName: fileName)
        
        if (!FileManager.default.fileExists(atPath: file)) {
            return nil
        }
        
        if let data = NSData(contentsOfFile: file) {
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data as Data)
            item = unarchiver.decodeObject(forKey: dataKey) as? Data
            unarchiver.finishDecoding()
            return item
        }
        
        return nil
    }
    
    private static func encodeDataObject(dataObject: UserData) {
        let encoder = PropertyListEncoder()
        do {
            let encodedData = try encoder.encode(dataObject)
            archiveDataObject(dataObject: encodedData)
        } catch(let error) {
            log.error(error.localizedDescription)
        }
    }
    
    private static func archiveDataObject(dataObject: Data) {
        let file = dataFileForName(fileName: fileName)
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(dataObject, forKey: dataKey)
        archiver.finishEncoding()
        data.write(toFile: file, atomically: true)
    }
    
    private static func documentPath() -> String {
        let allPathes = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        return allPathes[0]
    }
    
    private static func dataFileForName(fileName : String) -> String {
        return (documentPath() as NSString).appendingPathComponent(fileName)
    }
}
