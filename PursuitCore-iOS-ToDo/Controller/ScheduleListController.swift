//
//  ScheduleListController.swift
//  PursuitCore-iOS-ToDo
//
//  Created by Eric Widjaja on 4/23/20.
//  Copyright © 2020 ericW. All rights reserved.
//

import UIKit

class ScheduleListController: UIViewController {

//MARK: - Properties
    
    
    
//MARK: - IBActions and IBOutlets
    @IBOutlet weak var toDoTableView: UITableView!
    //Data that we are putting inside TableView is -> an array of events, we need to create Event.swift Model File
    
    @IBAction func addNewEvent(segue: UIStoryboardSegue) {

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
