//  FileManager+Extensions.swift
//  PursuitCore-iOS-ToDo
//
//  Created by Eric Widjaja on 4/26/20.
//  Copyright © 2020 ericW. All rights reserved.
//

import Foundation


extension FileManager {
    
    /*function gets URL path to documents directory
            FileManager.getDocumentsDirectory() // type method
     If using NOT "static func", an instance (let 'fileManager') has to be created
     let fileManager = FileManager()
     fileManager.getDocumentsDirectory() // instance method
    */
    static func getDocumentsDirectory() -> URL { //'.default' is a singleton
        
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
