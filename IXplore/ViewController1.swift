//
//  ViewController1.swift
//  IXplore
//
//  Created by Alan Yu on 7/8/16.
//  Copyright © 2016 Alan-Yu. All rights reserved.
//

import UIKit
import MapKit

class ViewController1: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var tableView: UITableView!
   
    
    var myEntry:[Entry] = []
    
    @IBAction func barButtonPressed(sender: AnyObject) {
        
        let addPhotoView = addPhotoViewController(nibName: "addPhotoViewController", bundle: nil)
        
        self.showViewController(addPhotoView, sender: self)
    }
    
    
    
    
    let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -33.906764,longitude: 18.4164983), span: MKCoordinateSpanMake(0.05, 0.05))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        //add entries and set inital region
        myEntry = EntryController.sharedInstance.returnMyEntries()
        map.addAnnotations(myEntry)
        map.setRegion(region, animated: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addButtonClicked))
        
        self.navigationItem.title = "iXplore"
        self.navigationItem.rightBarButtonItem = addButton
        
        
        
        
        myEntry = EntryController.sharedInstance.returnMyEntries()
        map.addAnnotations(myEntry)
    }

    
    func addButtonClicked(){
        let AddPhotoPage = AddPhotoViewController(nibName: "AddPhotoViewController", bundle: nil)
        self.showViewController(AddPhotoPage, sender: self)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myEntry.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell1")
        cell.textLabel?.text = myEntry[indexPath.row].title
        return cell
    }
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        let newRegion = MKCoordinateRegion(center: view.annotation!.coordinate, span: MKCoordinateSpanMake(0.05, 0.05))
        map.setRegion(newRegion, animated: true)
        
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
