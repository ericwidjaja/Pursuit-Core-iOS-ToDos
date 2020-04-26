//  FileManager+Extensions.swift
//  PursuitCore-iOS-ToDo
//  Created by Eric Widjaja on 4/26/20.
//  Copyright © 2020 ericW. All rights reserved.
//

import Foundation

public enum Directory {
  case documentsDirectory
  case cachesDirectory
}

extension FileManager {
    
    static func getDocumentsDirectory() -> URL { 
        // returns a URL to the documents directory for the app
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    static func pathToDocumentsDirectory(with filename: String) -> URL {
        return getDocumentsDirectory().appendingPathComponent(filename)
    }
}
