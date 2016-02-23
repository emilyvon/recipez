//
//  Recipe.swift
//  recipez
//
//  Created by Mengying Feng on 11/02/2016.
//  Copyright © 2016 Mengying Feng. All rights reserved.
//

import Foundation
import CoreData

//UIKit
import UIKit


class Recipe: NSManagedObject {
    
    // Convert image into data to be saved in the Recipe model
    // In the Recipe model, attribute image is of type Binary data, not the actual image
    func setRecipeImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }

    func getRecipeImage() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }
}
