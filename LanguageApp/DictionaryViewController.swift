//
//  DictionaryViewController.swift
//  LanguageApp
//
//  Created by Schmitty J Smith on 1/13/16.
//  Copyright (c) 2016 Schmitty B Smith. All rights reserved.
//

import UIKit

class DictionaryViewController: UIViewController {

    @IBOutlet weak var wordToFind: UITextField!
    @IBOutlet weak var englishSearchButtonButton: UIButton!
    @IBOutlet weak var ojibweSearchButtonButton: UIButton!
    @IBOutlet weak var LabelForSavedText: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var englishOjibweButtonPseudoBool: String = ""
    var DictionaryArray: Array<DictionaryWordEntry> = []
    var currentDictionary: Dictionary<String,String> = ["english":"", "ojibwe":"", "type":"", "subtype":""]
    var foundWord: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.englishSearchButtonButton.setTitle("\u{25CB}", forState: .Normal)
        self.ojibweSearchButtonButton.setTitle("\u{25CB}", forState: .Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func englishSearchButton(sender: AnyObject) {
        if self.englishOjibweButtonPseudoBool == "" || self.englishOjibweButtonPseudoBool == "ojibwe" {
            self.englishSearchButtonButton.setTitle("\u{2B24}", forState: .Normal)
            self.ojibweSearchButtonButton.setTitle("\u{25CB}", forState: .Normal)
            self.englishOjibweButtonPseudoBool = "english"
        }
    }
    
    @IBAction func ojibweSearchButton(sender: AnyObject) {
        if self.englishOjibweButtonPseudoBool == "" || self.englishOjibweButtonPseudoBool == "english" {
            self.ojibweSearchButtonButton.setTitle("\u{2B24}", forState: .Normal)
            self.englishSearchButtonButton.setTitle("\u{25CB}", forState: .Normal)
            self.englishOjibweButtonPseudoBool = "ojibwe"
        }
        
    }
    
    @IBAction func searchInDictionaryButton(sender: AnyObject) {
        findDictionaryWordEntry(self.wordToFind.text!, oOrE: self.englishOjibweButtonPseudoBool)
    }
    
    func findDictionaryWordEntry(wordToFind:String, oOrE:String) {
            switch oOrE {
            case "english":
                findDictionaryEntryWithEnglish(wordToFind)
                addFoundWordLabel(foundWord)
            case "ojibwe":
                findDictionaryEntryWithOjibwe(wordToFind)
                addFoundWordLabel(foundWord)
            default:
                if (wordToFind == "") {
                    let searchErrorAlertWord = UIAlertController(title: "Search Error", message: "Please Enter Word to Search", preferredStyle: UIAlertControllerStyle.Alert)
                    searchErrorAlertWord.addAction(UIAlertAction(title: "Return", style: UIAlertActionStyle.Cancel, handler: nil))
                    self.presentViewController(searchErrorAlertWord, animated: true, completion: nil)
                    

                }
                else {
                    let searchErrorAlertLang = UIAlertController(title: "Search Error", message: "Please Select English or Ojibwe", preferredStyle: UIAlertControllerStyle.Alert)
                    searchErrorAlertLang.addAction(UIAlertAction(title: "Return", style: UIAlertActionStyle.Cancel, handler: nil))
                    self.presentViewController(searchErrorAlertLang, animated: true, completion: nil)

                    
                }
        }
    }
    
    func findDictionaryEntryWithEnglish(wordToFind:String) {
        
        var highPoint = DictionaryArray.count - 1
        var midPoint = highPoint/2
        var reRun = false
        
        while (reRun == false) {
            for i in midPoint...highPoint {
                if ((DictionaryArray[i].english) == wordToFind) {
                    self.foundWord = DictionaryArray[i].ojibwe!
                    NSLog("High Point: \(highPoint)")
                    NSLog("Mid Point: \(midPoint)")
                }
                else {
                    reRun = true
                    highPoint = midPoint
                    midPoint = highPoint/2
                    NSLog("High Point: \(highPoint)")
                    NSLog("Mid Point: \(midPoint)")
                }
            }
        }

    }
    
    func findDictionaryEntryWithOjibwe(wordToFind:String) {
        
        var highPoint = DictionaryArray.count - 1
        var midPoint = highPoint/2
        var reRun = false
        
        while (reRun == false) {
            for i in midPoint...highPoint {
                if ((DictionaryArray[i].ojibwe) == wordToFind) {
                    self.foundWord = DictionaryArray[i].english!
                    NSLog("High Point: \(highPoint)")
                    NSLog("Mid Point: \(midPoint)")
                    
                }
                else {
                    reRun = true
                    highPoint = midPoint
                    midPoint = highPoint/2
                    NSLog("High Point: \(highPoint)")
                    NSLog("Mid Point: \(midPoint)")
                }
            }
        }
    }
    
    func addFoundWordLabel(word: String){
        let label = UILabel()
        label.frame = CGRectMake(50, 150, 200, 21)
        label.textAlignment = NSTextAlignment.Left
        label.text = word
        self.scrollView.addSubview(label)
        
    }
    
    
    
}


