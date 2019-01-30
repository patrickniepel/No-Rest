//
//  PersistencyController.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

struct PersistencyController: Codable {
    
    static func loadUserData() {
        if let userData = loadData() {
            UserData.sharedInstance = userData
        }
        
        if UserData.sharedInstance.exercises.isEmpty {
            UserData.sharedInstance.exercises = DefaultExercise.allExercises()
            storeUserData()
        }
    }
    
    static func storeUserData() {
        storeData(data: UserData.sharedInstance)
    }
    
    static func currentWorkoutID() -> Int {
        let id = UserDefaults.standard.integer(forKey: NRConstants.DataIdentifiers.currentWorkoutID) + 1
        storeCurrentWorkoutID(id)
        return id
    }
    
    private static func storeCurrentWorkoutID(_ id: Int) {
        UserDefaults.standard.set(id, forKey: NRConstants.DataIdentifiers.currentWorkoutID)
    }
    
    static func currentExerciseID() -> Int {
        let id = UserDefaults.standard.integer(forKey: NRConstants.DataIdentifiers.currentExerciseID) + 1
        storeCurrentExerciseID(id)
        return id
    }
    
    private static func storeCurrentExerciseID(_ id: Int) {
        UserDefaults.standard.set(id, forKey: NRConstants.DataIdentifiers.currentExerciseID)
    }
}

private extension PersistencyController {
    static let fileName = NRConstants.DataIdentifiers.fileName
    static let dataKey = NRConstants.DataIdentifiers.userDataKey
    
    static func loadData() -> UserData? {
        return decodeDataObject()
    }
    
    static func storeData(data: UserData) {
        encodeDataObject(dataObject: data)
    }
    
    static func decodeDataObject() -> UserData? {
        
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
    
    static func unarchiveDataObject() -> Data? {
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

    
    // MARK: - MensaData
    static func encodeDataObject(dataObject: UserData) {
        let encoder = PropertyListEncoder()
        do {
            let encodedData = try encoder.encode(dataObject)
            archiveDataObject(dataObject: encodedData)
        } catch(let error) {
            log.error(error.localizedDescription)
        }
    }
    
    static func archiveDataObject(dataObject: Data) {
        let file = dataFileForName(fileName: fileName)
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(dataObject, forKey: dataKey)
        archiver.finishEncoding()
        data.write(toFile: file, atomically: true)
    }
    
    static func documentPath() -> String {
        let allPathes = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        return allPathes[0]
    }
    
    static func dataFileForName(fileName : String) -> String {
        return (documentPath() as NSString).appendingPathComponent(fileName)
    }
}
