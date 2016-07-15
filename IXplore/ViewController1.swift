//
//  ViewController1.swift
//  IXplore
//
//  Created by Alan Yu on 7/8/16.
//  Copyright © 2016 Alan-Yu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation



class ViewController1: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate , CLLocationManagerDelegate, AddPhotoDelegate{
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    
    var myEntry:[Entry] = []
    let locationManager = CLLocationManager()
    
    
    let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -33.906764,longitude: 18.4164983), span: MKCoordinateSpanMake(0.05, 0.05))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set the delegate
        map.delegate = self
        
        // Do any additional setup after loading the view.
        
        let myCell = UINib(nibName: "MyCell", bundle: nil)
        self.tableView.registerNib(myCell, forCellReuseIdentifier: "cell1")
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addButtonClicked))
        self.navigationItem.title = "iXplore"
        self.navigationItem.rightBarButtonItem = addButton
        
        
        
      
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        
        //load entries
        if let entries = NSKeyedUnarchiver.unarchiveObjectWithFile(entryURL().path!) as? [Entry] {
            myEntry = entries
        }
        
        
        
        //add entries and set inital region
        map.addAnnotations(myEntry)
        map.setRegion(region, animated: true)
        
    }
    
   
    
    override func viewWillAppear(animated: Bool) {
        
        map.addAnnotations(myEntry)
        tableView.reloadData()
        
        NSKeyedArchiver.archiveRootObject(myEntry, toFile: entryURL().path!)
    }
    
    
    func addButtonClicked(){
        
        print(locationManager.location?.coordinate.latitude)
        print(locationManager.location?.coordinate.longitude)
        
        let AddPhotoPage = AddPhotoViewController(nibName: "AddPhotoViewController", bundle: nil)
        AddPhotoPage.currentLati = locationManager.location?.coordinate.latitude
        AddPhotoPage.currentLong = locationManager.location?.coordinate.longitude
        AddPhotoPage.delegate = self
        self.navigationController?.pushViewController(AddPhotoPage, animated: true)
    }
    
   
    
    //add it to the array, and add it to the map
    func addEntry(entry: Entry) -> Bool {
        myEntry.append(entry)
        map.addAnnotation(entry)
        // need to add it to the row
        
       
        return true
    }
    
    
    func entryURL() -> NSURL{
        let manager = NSFileManager.defaultManager()
        let documents =
            manager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        let fileURL = documents.URLByAppendingPathComponent("entries.txt")
        return fileURL
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myEntry.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell1") as! MyCell
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MMMM d, YYYY"
        
        cell.date.text = formatter.stringFromDate(myEntry[indexPath.row].date)
        cell.title.text = myEntry[indexPath.row].title
        cell.imageBox!.image = myEntry[indexPath.row].image
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            //remove annotation from the map
            map.removeAnnotation(myEntry[indexPath.row])
            // In case of the delete action, remove data from the data model
            myEntry.removeAtIndex(indexPath.row)
            // Refresh table view
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }

    }
    
//    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
//        let annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier("Pin") ?? MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Pin")
//        
//        return annotationView
//    }
   
    
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
