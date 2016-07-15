//
//  Entry.swift
//  IXplore
//
//  Created by Alan Yu on 7/11/16.
//  Copyright © 2016 Alan-Yu. All rights reserved.
//

import UIKit
import MapKit

class Entry: NSObject, MKAnnotation, NSCoding{

    var title: String?
    var notes: String
    var date: NSDate
    var image: UIImage?
    var coordinate: CLLocationCoordinate2D 
    
    // you don't always need notes or a date for something
    init(titleString: String?, locationCoord: CLLocationCoordinate2D, pictureDate: NSDate?, pictureNotes:String?, picture: UIImage?) {
        title = titleString ?? "Untitled"
        coordinate = locationCoord
        image = picture ?? nil
        notes = pictureNotes ?? ""
        date = pictureDate ?? NSDate()
     
    }
    
    
    required init?(coder: NSCoder) {
        title = (coder.decodeObjectForKey("title") as? String) ?? "Untitled"
        notes = (coder.decodeObjectForKey("notes") as? String) ?? ""
        date = (coder.decodeObjectForKey("date") as? NSDate) ?? NSDate()
        let latitude = (coder.decodeObjectForKey("latitude") as? CLLocationDegrees) ?? 0.0
        let longitude = (coder.decodeObjectForKey("longitude") as? CLLocationDegrees) ?? 0.0
        
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        image = (coder.decodeObjectForKey("image") as? UIImage) ?? nil
        
    }
    
    func encodeWithCoder(coder: NSCoder) {
        
        let latitude:Double = coordinate.latitude
        let longitude:Double = coordinate.longitude
        
        coder.encodeObject(image, forKey:"image")
        coder.encodeObject(title, forKey:"title")
        coder.encodeObject(notes, forKey:"notes")
        coder.encodeObject(date, forKey:"date")
        coder.encodeObject(coordinate.latitude, forKey:"latitude")
        coder.encodeObject(coordinate.longitude, forKey:"longitude")
        
        print(title)
        print(latitude)
        print(longitude)
        
        
    }
}
