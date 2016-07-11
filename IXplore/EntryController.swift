//
//  File.swift
//  IXplore
//
//  Created by Alan Yu on 7/11/16.
//  Copyright © 2016 Alan-Yu. All rights reserved.
//

import Foundation
import MapKit

class EntryController{
    
    static var sharedInstance:EntryController = EntryController()
    
    private var myEntries:[Entry] = [Entry(titleString: "Workshop 17", locationCoord: CLLocationCoordinate2D(latitude: -33.906764,longitude: 18.4164983)),
                             Entry(titleString: "Truth Coffee", locationCoord: CLLocationCoordinate2D(latitude: -33.9281976,longitude: 18.4227045)),
                             Entry(titleString: "Chop Chop Coffee", locationCoord: CLLocationCoordinate2D(latitude: -33.9271879,longitude: 18.4327055))]
   
    func returnMyEntries() -> [Entry]{
        return myEntries
    }
    
    func addEntry(newEntry:Entry) {
        
        //do shit here
        
        myEntries.append(newEntry)
    }
    
}