//  CreateEventController.swift
//  PursuitCore-iOS-ToDo
//
//  Created by Eric Widjaja on 4/23/20.
//  Copyright © 2020 ericW. All rights reserved.
//

import UIKit

class CreateEventController: UIViewController {

//MARK: - Properties
    //This is the event that goes back in the sequeway
    var event: Event? //default value is nill
    
    
//MARK: - IBActions and IBOutlets

    @IBOutlet weak var createEventTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
        
        
        
//MARK: - Functions
    @IBAction func datePickerSelected(sender: UIDatePicker) {
        //whenever the date is selected, update the event's date
        event?.date = sender.date
        
    }
    
    
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
        event?.name = textField.text ?? "No Event Name yet"
        
        
        //
        return true
    }
}

