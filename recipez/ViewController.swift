//
//  ViewController.swift
//  recipez
//
//  Created by Mengying Feng on 11/02/2016.
//  Copyright © 2016 Mengying Feng. All rights reserved.
//

import UIKit

// CoreData
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var recipes = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    // we want to fetch result when the app first loaded, and when this view appear
    // so best to do it in viewDidAppear
    func fetchAndSetResults() {
        // Get the one and only app delegate
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        // Get the context, i.e. managedObjectContext
        let context = app.managedObjectContext
        // Get data
        let fetchRequest = NSFetchRequest(entityName: "Recipe")
        
        // fetch request can fail
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.recipes = results as! [Recipe]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCellWithIdentifier("RecipeCell") as? RecipeTableViewCell {
            let recipe = recipes[indexPath.row]
            cell.configureCell(recipe)
            return cell
            
        } else {
            return RecipeTableViewCell()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}

