//  FileManager+Extensions.swift
//  PursuitCore-iOS-ToDo
//  Created by Eric Widjaja on 4/26/20.

import Foundation

extension FileManager {
    
    static func getDocumentsDirectory() -> URL {
        
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    static func pathToDocumentsDirectory(with filename: String) -> URL {
        return getDocumentsDirectory().appendingPathComponent(filename)
    }
}
