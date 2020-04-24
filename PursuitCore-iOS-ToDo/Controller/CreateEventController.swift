//  CreateEventController.swift
//  PursuitCore-iOS-ToDo
//
//  Created by Eric Widjaja on 4/23/20.
//  Copyright © 2020 ericW. All rights reserved.
//

import UIKit

class CreateEventController: UIViewController {

//MARK: - Properties
    
    
//MARK: - IBActions and IBOutlets

    @IBOutlet weak var createEventTextField: UITextField!

        
        
        
//MARK: - Regular Functions
    
    
//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //set the VC as the delegate for the textField
        createEventTextField.delegate = self
        
    
        
        
    }
}

//MARK: - Extension
extension CreateEventController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //dismiss the keyboard
        textField.resignFirstResponder()
        
        return true
    }
}

