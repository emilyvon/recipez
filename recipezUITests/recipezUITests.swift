//
//  recipezUITests.swift
//  recipezUITests
//
//  Created by Mengying Feng on 21/04/2016.
//  Copyright © 2016 Mengying Feng. All rights reserved.
//

import XCTest

class recipezUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        
        let app = XCUIApplication()
        app.navigationBars["recipez.View"].buttons["Add"].tap()
        app.textFields["Recipe title"].tap()
        app.textFields["Recipe title"]
        
        let recipeIngredientsTextField = app.textFields["Recipe ingredients"]
        recipeIngredientsTextField.tap()
        recipeIngredientsTextField.tap()
        app.textFields["Recipe ingredients"]
        
        let recipeStepsTextField = app.textFields["Recipe steps"]
        recipeStepsTextField.tap()
        recipeStepsTextField.tap()
        app.textFields["Recipe steps"]
        app.buttons["ADD IMAGE"].tap()
        app.tables.buttons["Moments"].tap()
        app.collectionViews["PhotosGridView"].cells["Photo, Landscape, August 09, 2012, 4:22 AM"].tap()
        app.buttons["Create Recipe"].tap()
        
        
        
    }
    
}
