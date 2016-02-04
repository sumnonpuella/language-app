//
//  DictionaryViewController.swift
//  LanguageApp
//
//  Created by Schmitty J Smith on 1/13/16.
//  Copyright (c) 2016 Schmitty B Smith. All rights reserved.
//

import UIKit

class DictionaryViewController: UIViewController {

    
    @IBOutlet weak var TextFieldInput: UITextField!
    @IBOutlet weak var LabelForSavedText: UILabel!
    @IBOutlet weak var wordToFind: UITextField!
    @IBOutlet weak var englishSearchButtonButton: UIButton!
    @IBOutlet weak var ojibweSearchButtonButton: UIButton!
    var englishOjibweButtonPseudoBool: String? = nil
    //Need notes on this!!!!!
    var testDictionaryArray: Array<DictionaryWordEntry> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var newTestDictionaryObject = OjibweEnglishDictionary();
        testDictionaryArray = newTestDictionaryObject.usableDictionaryArray;
        
        self.englishSearchButtonButton.setTitle("\u{25CB}", forState: .Normal)
        self.ojibweSearchButtonButton.setTitle("\u{25CB}", forState: .Normal)
//        var yetAnotherArray: Array<AnyObject> = []
//        for i in testDictionaryArray {
//            yetAnotherArray.append(i)
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SaveEnglish(sender: UIButton) {
        if (self.TextFieldInput != nil) {
            self.LabelForSavedText.text = self.TextFieldInput.text;
        }
    }
    
    @IBAction func englishSearchButton(sender: AnyObject) {
        if self.englishOjibweButtonPseudoBool == nil || self.englishOjibweButtonPseudoBool == "ojibwe" {
            self.englishSearchButtonButton.setTitle("\u{2B24}", forState: .Normal)
            self.ojibweSearchButtonButton.setTitle("\u{25CB}", forState: .Normal)
            self.englishOjibweButtonPseudoBool = "english"
        }
    }
    
    @IBAction func ojibweSearchButton(sender: AnyObject) {
        if self.englishOjibweButtonPseudoBool == nil || self.englishOjibweButtonPseudoBool == "english" {
            self.ojibweSearchButtonButton.setTitle("\u{2B24}", forState: .Normal)
            self.englishSearchButtonButton.setTitle("\u{25CB}", forState: .Normal)
            self.englishOjibweButtonPseudoBool = "ojibwe"
        }
        
    }
    
    @IBAction func searchInDictionaryButton(sender: AnyObject) {
        findDictionaryWordEntry(self.wordToFind.text, oOrE: self.englishOjibweButtonPseudoBool!)
    }
    func findDictionaryWordEntry(wordToFind:String, oOrE:String) {
        
        for i in testDictionaryArray {
            switch oOrE {
            case "english":
                self.LabelForSavedText.text = "Switch logged English"
            case "ojibwe":
                self.LabelForSavedText.text = "Switch logged Ojibwe"
            default:
                self.LabelForSavedText.text = "Switch logged default"
            }
        }
    }
    
    
}


