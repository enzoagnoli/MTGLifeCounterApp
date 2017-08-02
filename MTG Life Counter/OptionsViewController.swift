//
//  OptionsViewController.swift
//  MTG Life Counter
//
//  Created by Enzo Agnoli on 7/19/17.
//  Copyright © 2017 Enzo Agnoli. All rights reserved.
//

import UIKit


protocol OptionsViewControllerProtocol: class {
    func sendArrayBack(counter: [String])
    func dismissMyself()
    
}


class OptionsViewController: UIViewController {
    @IBOutlet weak var poisonButtonOutlet: UIButton!
    @IBOutlet weak var energyButtonOutlet: UIButton!
    @IBOutlet weak var experienceButtonOutlet: UIButton!
    @IBOutlet weak var matchTimerButtonOutlet: UIButton!
    
    weak var previousViewController: OptionsViewControllerProtocol?

    var trueValuedCounterBoolsArray: [String] = []

    @IBAction func toSetNewGameView(_ sender: Any) {
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
        /*
        dismiss(animated: true) {
            self.previousViewController?.dismissMyself()
        }
 */
    }
    @IBAction func toLifeManagementView(_ sender: Any) {
       dismiss(animated: true) { 
            self.previousViewController?.sendArrayBack(counter: self.trueValuedCounterBoolsArray)
        }
    }
    @IBAction func poisonOnOff(_ sender: Any) {
        
        if poisonButtonOutlet.backgroundColor == UIColor.lightGray {
            poisonButtonOutlet.backgroundColor = UIColor.blue
        }
        else if poisonButtonOutlet.backgroundColor == UIColor.blue {
            poisonButtonOutlet.backgroundColor = UIColor.lightGray
        }
        
        if !trueValuedCounterBoolsArray.contains("poison"){
            trueValuedCounterBoolsArray.insert("poison", at:0)
            print(trueValuedCounterBoolsArray)
            
        } else {
            trueValuedCounterBoolsArray = trueValuedCounterBoolsArray.filter { $0 != "poison" }
            print(trueValuedCounterBoolsArray)
            
        }
        
    }
    @IBAction func energyOnOff(_ sender: Any) {
        
        if energyButtonOutlet.backgroundColor == UIColor.lightGray {
            energyButtonOutlet.backgroundColor = UIColor.blue
        }
        else if energyButtonOutlet.backgroundColor == UIColor.blue {
            energyButtonOutlet.backgroundColor = UIColor.lightGray
        }
        
        if !trueValuedCounterBoolsArray.contains("energy"){
            trueValuedCounterBoolsArray.insert("energy", at:0)
            print(trueValuedCounterBoolsArray)
            
        } else {
            trueValuedCounterBoolsArray = trueValuedCounterBoolsArray.filter { $0 != "energy" }
            print(trueValuedCounterBoolsArray)
            
        }
        
    }
    @IBAction func experienceOnOff(_ sender: Any) {
        
        if experienceButtonOutlet.backgroundColor == UIColor.lightGray {
            experienceButtonOutlet.backgroundColor = UIColor.blue
        }
        else if experienceButtonOutlet.backgroundColor == UIColor.blue {
            experienceButtonOutlet.backgroundColor = UIColor.lightGray
        }
        
        if !trueValuedCounterBoolsArray.contains("experience"){
            trueValuedCounterBoolsArray.insert("experience", at:0)
            print(trueValuedCounterBoolsArray)
            
        } else {
            trueValuedCounterBoolsArray = trueValuedCounterBoolsArray.filter { $0 != "experience" }
            print(trueValuedCounterBoolsArray)
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !trueValuedCounterBoolsArray.contains("poison") {
            poisonButtonOutlet.backgroundColor = UIColor.lightGray
        } else {
            poisonButtonOutlet.backgroundColor = UIColor.blue
        }
        if !trueValuedCounterBoolsArray.contains("energy") {
            energyButtonOutlet.backgroundColor = UIColor.lightGray
        } else {
            energyButtonOutlet.backgroundColor = UIColor.blue
        }
        if !trueValuedCounterBoolsArray.contains("experience"){
            experienceButtonOutlet.backgroundColor = UIColor.lightGray
        } else {
            experienceButtonOutlet.backgroundColor = UIColor.blue
        }
        matchTimerButtonOutlet.backgroundColor = UIColor.lightGray
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLifeCounter" {
            let lifeManagementViewController = segue.destination as! LifeManagementViewController
            lifeManagementViewController.counterViewsToLoad = trueValuedCounterBoolsArray
        }
        
        
        
    }
}

