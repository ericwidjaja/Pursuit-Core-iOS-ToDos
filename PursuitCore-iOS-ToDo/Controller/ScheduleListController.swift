//
//  ScheduleListController.swift
//  PursuitCore-iOS-ToDo
//
//  Created by Eric Widjaja on 4/23/20.
//  Copyright © 2020 ericW. All rights reserved.
//

import UIKit

enum SectionTitle: String, CaseIterable {
    case toDoTasks = "toDoTasks"
    case doneTasks = "doneTasks"
}

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
        //After getting the values of the variables, we can insert this new created event into the events array at index 0 or the top of the array.
        //1. update data model e.g.update the events array
        events.insert(createdEvent, at: 0)
        //created an indexPath for the new event's path -> to be inserted into the tableView
        let indexPath = IndexPath(row: 0, section: 0)
        //show the new event the indexPath into tableView
        //2. we need to update the tableview
        toDoTableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    //MARK: - Regular Functions
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        events = Event.getTestData().sorted { $0.date < $1.date }
        toDoTableView.dataSource = self
    }
}

//MARK: - Extension
extension ScheduleListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = toDoTableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        let selectedEvent = events[indexPath.row]
        cell.textLabel?.text = selectedEvent.name
        cell.detailTextLabel?.text = selectedEvent.date.description
        return cell
    }
    //deleting rows in a table view
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .insert:
            // only gets called if "insertion control" exist and gets selected
            print("inserting....")
        case .delete:
            print("deleting..")
            // 1. remove item for the data model e.g events
            events.remove(at: indexPath.row) // remove event from events array
            
            // 2. then update the table view
            tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            print("......")
        }
    }
}
