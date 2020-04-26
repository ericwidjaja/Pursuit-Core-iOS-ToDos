//  ScheduleListController.swift
//  PursuitCore-iOS-ToDo
//  Created by Eric Widjaja on 4/23/20.
//  Copyright © 2020 ericW. All rights reserved.

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
    
    
    @IBAction func addNewEvent(segue: UIStoryboardSegue) {
        // get reference to the CreateEventController, using sequeway property from addNewEvent.
        guard let createEventController = segue.source as? CreateEventController,
            let createdEvent = createEventController.event
            else {
                fatalError("Failed to Access CreateEventController")
        }
        // persist (save) event to documents directory
        do {
            try PersistenceHelper.save(event: createdEvent)
        } catch {
            print("error saving event with error: \(error)")
        }
        
        let indexPath = IndexPath(row: events[0].count, section: 0)
        events[0].append(createdEvent)
        toDoTableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    //MARK: - Regular Functions
    
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoTableView.dataSource = self
        toDoTableView.delegate = self
        // print path to documents directory
        print(FileManager.getDocumentsDirectory())
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
        return section == 0 ? "To Do Tasks" : "Completed Tasks"
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
}
