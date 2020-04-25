//
//  ScheduleListController.swift
//  PursuitCore-iOS-ToDo
//
//  Created by Eric Widjaja on 4/23/20.
//  Copyright © 2020 ericW. All rights reserved.
//

import UIKit

class ScheduleListController: UIViewController {


    
    
    
    
//MARK: - IBActions and IBOutlets
    @IBOutlet weak var toDoTableView: UITableView!
    //Data that we are putting inside TableView is -> an array of events, we need to create Event.swift Model File. Why swift? because we are not subclassing anything, we do not to use UIKit that available as in CocoaTouch Class.
//MARK: - Internal Properties
    var events = [Event]()
/*var events = [Event]() {
        //        didSet {//property observer, whenever there's new data, it will reload and return the data into tableview
        //            toDoTableView.reloadData()}
        //BUT We are using different method, we need to insert either on top or bottom of the tblView
    }
*/
    @IBAction func addNewEvent(segue: UIStoryboardSegue) {
        // get reference to the CreateEventController, using sequeway property from addNewEvent. where we are coming from? so use segue.source and guard them
        guard let createEventController = segue.source as? CreateEventController,
            let createdEvent = createEventController.event else {//if we do not get CreateEventController we failed
            fatalError("Failed to Access CreateEventController")
        }
        //After getting the values of the variables, we can insert this new created event into the events array
        events
    }
    
//MARK: - Regular Functions

    
//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - Extension
extension ScheduleListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = toDoTableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        return cell
    }
    
    
}
