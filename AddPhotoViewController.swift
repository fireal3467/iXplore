//
//  addPhotoViewController.swift
//  IXplore
//
//  Created by Alan Yu on 7/11/16.
//  Copyright © 2016 Alan-Yu. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "Add Entry"
        self.navigationItem.leftBarButtonItem = cancelButton
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func saveEntry(){
        
        //        EntryController.sharedInstance.addEntry()
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
 
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

