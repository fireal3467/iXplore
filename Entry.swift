//
//  Entry.swift
//  IXplore
//
//  Created by Alan Yu on 7/11/16.
//  Copyright © 2016 Alan-Yu. All rights reserved.
//

import UIKit
import MapKit

class Entry: NSObject, MKAnnotation {
    
    
    
    var title: String?
    var notes: String?
    var date: String?
    var coordinate: CLLocationCoordinate2D 
    
    // you don't always need notes or a date for something
    init(titleString: String, locationCoord: CLLocationCoordinate2D) {
        title = titleString
        coordinate = locationCoord
        
    }
    
 
    
    
    
    
    
}
