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
    var events = Array(repeating: [Event](), count: 2) {
        didSet {
            DispatchQueue.main.async {
                self.toDoTableView.reloadData()
            }
        }
    }
    /*var events = [Event]() {
     //        didSet {//property observer, whenever there's new data, it will reload and return the data into tableview
     //            toDoTableView.reloadData()}
     //BUT We are using different method, we need to insert either on top or bottom of the tblView
     }
     */
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM, d, yyyy, hh:mm a"
        formatter.timeZone = .current
        return formatter
    }()
    
    
    @IBAction func addNewEvent(segue: UIStoryboardSegue) {
        // get reference to the CreateEventController, using sequeway property from addNewEvent. where we are coming from? so use segue.source and guard them
        guard let createEventController = segue.source as? CreateEventController,
            let createdEvent = createEventController.event else {//if we do not get CreateEventController we failed
                fatalError("Failed to Access CreateEventController")
        }
        //After getting the values of the variables, we can insert this new created event into the events array at index 0 or the top of the array.
        //1. update data model e.g.update the events array
        //        events[0].append(createdEvent)
        //        events[0].insert(createdEvent, at: 0)
        //events.insert(createdEvent, at: 0)
        //created an indexPath for the new event's path -> to be inserted into the tableView
        let indexPath = IndexPath(row: events[0].count, section: 0)
        events[0].append(createdEvent)
        //show the new event the indexPath into tableView
        //2. we need to update the tableview
        toDoTableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    //MARK: - Regular Functions
    
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        events = Event.getTestData().sorted { $0.date < $1.date }
        toDoTableView.dataSource = self
        toDoTableView.delegate = self
    }
}

//MARK: - Extension
extension ScheduleListController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = toDoTableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        let selectedEvent = events[indexPath.section][indexPath.row]
        cell.textLabel?.text = selectedEvent.name
        cell.detailTextLabel?.text = selectedEvent.date.description
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return events.count
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //        return SectionTitle.allCases[section].rawValue
        return section == 0 ? "To Do Tasks" : "Done Task"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var event = events[indexPath.section][indexPath.row]
        event.isDone.toggle()
        events[indexPath.section].remove(at: indexPath.row)
        
        if event.isDone {
            let idxPath = IndexPath(row: events[1].count, section: 1) //Section  1 = DoneTask
            events[1].insert(event, at: idxPath.row)
        } else {
            let idxPath = IndexPath(row: events[0].count, section: 0) //Section 0 = Not Done
            events[0].insert(event, at: idxPath.row)
        }
    }
    
    //    deleting rows in a table view
    //    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //        switch editingStyle {
    //        case .insert:
    //            // only gets called if "insertion control" exist and gets selected
    //            print("inserting....")
    //        case .delete:
    //            print("deleting..")
    //            // 1. remove item for the data model e.g events
    //            events.remove(at: indexPath.row) // remove event from events array
    //
    //            // 2. then update the table view
    //            tableView.deleteRows(at: [indexPath], with: .automatic)
    //        default:
    //            print("......")
    //        }
    //    }
}
