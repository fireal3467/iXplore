//
//  DateTextField.swift
//  IXplore
//
//  Created by Alan Yu on 7/14/16.
//  Copyright © 2016 Alan-Yu. All rights reserved.
//

import UIKit

class DateTextField: UITextField {

    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    let datePicker = UIDatePicker()

    
    
    override init(frame:CGRect){
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MMMM d, YYYY"
        
        super.init(frame:frame)
        
        self.inputView = datePicker
        datePicker.datePickerMode = .Date
        datePicker.addTarget(self, action: #selector(updateText), forControlEvents: .ValueChanged)
        self.text = formatter.stringFromDate(datePicker.date)
        
        
    }
    
    required init?(coder:NSCoder){
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MMMM d, YYYY"
        
        super.init(coder:coder)
        
        self.inputView = datePicker
        datePicker.datePickerMode = .Date
        datePicker.addTarget(self, action: #selector(updateText), forControlEvents: .ValueChanged)
        self.text = formatter.stringFromDate(datePicker.date)
        
    }
    
    func updateText(){
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MMMM d, YYYY"
        
       
        self.text = formatter.stringFromDate(datePicker.date)
    }
    
    
    
}
