//
//  CreateRecipeViewController.swift
//  recipez
//
//  Created by Mengying Feng on 11/02/2016.
//  Copyright © 2016 Mengying Feng. All rights reserved.
//

import UIKit

// CoreData
import CoreData

class CreateRecipeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var recipeTitle: UITextField!
    @IBOutlet weak var recipeIngredients: UITextField!
    @IBOutlet weak var recipeSteps: UITextField!
    @IBOutlet weak var recipeImg: UIImageView!

    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        recipeImg.layer.cornerRadius = 4.0
        recipeImg.clipsToBounds = true

    }


    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        recipeImg.image = image
    }

    // present imagePicker when ADD IMAGE button pressed
    @IBAction func addImage(sender: AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    // make sure there is a title
    // save data to core data
    @IBAction func createRecipe(sender: AnyObject) {
        if let title = recipeTitle.text where title != "" {
            
            // get app delegate
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            
            //get managedObjectContext
            let context = app.managedObjectContext
            
            // create an entity reference for Recipe
            // can have multiple managedObjectContext in one app
            let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)!
            
            // create the recipe object we can use
            // no autocomplete for this
            let recipe = Recipe(entity: entity, insertIntoManagedObjectContext: context)
            
            // assign value into recipe object we just created
            recipe.title = title
            recipe.ingredients = recipeIngredients.text
            recipe.steps = recipeSteps.text
            recipe.setRecipeImage(recipeImg.image!)
            
            // save
            context.insertObject(recipe)
            do {
                try context.save()
            } catch {
                print("Could not save recipe")
            }
            
            // after we save recipe
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
}
