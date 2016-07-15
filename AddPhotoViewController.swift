//
//  addPhotoViewController.swift
//  IXplore
//
//  Created by Alan Yu on 7/11/16.
//  Copyright © 2016 Alan-Yu. All rights reserved.
//

import UIKit
import MapKit

class AddPhotoViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate, UITextViewDelegate {

    @IBOutlet weak var titleTextBox: UITextField!
   
    @IBOutlet weak var notes: UITextView!
    
    @IBOutlet weak var dateTextField: DateTextField!
  
    
    @IBOutlet weak var latitude: UITextField!
    
    @IBOutlet weak var longitude: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
 
    var currentLati:Double?
    var currentLong:Double?
   
    
    
    var delegate: AddPhotoDelegate?
    
    let imagePicker = UIImagePickerController()
    
    
    
    @IBAction func titleReturnPressed(sender: UITextField) {
        
        sender.resignFirstResponder()
    }
    
    
    @IBAction func latDonePressed(sender: UITextField) {
        
        sender.resignFirstResponder()
    }
    
    @IBAction func longDonePressed(sender: AnyObject) {
        sender.resignFirstResponder()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add gesture to picture touch
        let recognizer = UITapGestureRecognizer(target: self, action:#selector(imageTapped))
        recognizer.delegate = self
        self.imageView.addGestureRecognizer(recognizer)
       
        //set the image picker delegate
        imagePicker.delegate = self
        imagePicker.sourceType = .PhotoLibrary
        
        
        //set textview delegate
        notes.delegate = self
        
        
        //create the cancel button and put it on the navibar
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(cancelButtonClicked))
        
        self.navigationItem.title = "Add Entry"
        self.navigationItem.leftBarButtonItem = cancelButton
        

        // Do any additional setup after loading the view.
        
        print("stuff is happening")
        if let long:Double = currentLong {
            longitude.text = String(long)
        }
        if let lati:Double = currentLati {
            latitude.text = String(lati)
        }
    }
    
    
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    
    func imageTapped(){
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        self.imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func textViewDidBeginEditing(textView: UITextView) {
        if(textView.text == "notes"){
            textView.text = ""
            textView.textColor = UIColor.blackColor()
        }
    }
    
    
    func textViewDidEndEditing(textView: UITextView) {
        if(textView.text == ""){
            textView.text = "notes"
            textView.textColor = UIColor.lightGrayColor()
        }
    }
    
    
  
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func cancelButtonClicked() {
        //tells the parent view controller to dismiss the current view controller
            self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func saveButton(sender: AnyObject) {
        let title = titleTextBox.text
        //if no notes exist, just default to nothing
        let note = notes.text 
        let date = dateTextField.datePicker.date
        let long:Double? = Double(longitude.text!)
        let lati:Double? = Double(latitude.text!)
        let pictureImage = imageView.image
        let newEntry = Entry(titleString: title!, locationCoord: CLLocationCoordinate2D(latitude: lati!, longitude: long!), pictureDate: date, pictureNotes: note, picture: pictureImage!)
        
        
        
        delegate?.addEntry(newEntry)
        self.navigationController?.popViewControllerAnimated(true)
       
        
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

