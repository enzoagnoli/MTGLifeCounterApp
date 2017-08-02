//
//  LifeManagementViewController.swift
//  MTG Life Counter
//
//  Created by Enzo Agnoli on 7/17/17.
//  Copyright © 2017 Enzo Agnoli. All rights reserved.
//

import UIKit

class LifeManagementViewController: UIViewController, OptionsViewControllerProtocol{
    
    var playerOne = Player(name:"Player One")
    var playerTwo = Player(name:"Player Two")
    
    var counterViewsToLoad: [String] = []
    func dismissMyself() {
        dismiss(animated: false, completion: nil)
    }
    func sendArrayBack(counter: [String]) {
        counterViewsToLoad = counter
        
        print(counterViewsToLoad)
        
        if counterViewsToLoad.contains("poison") {
            playerOnePoisonView.isHidden = false
            playerTwoPoisonView.isHidden = false
            playerOnePreviousPoisonTotalTextView.isHidden = false
            playerTwoPreviousPoisonTotalTextView.isHidden = false
        } else {
            playerOnePoisonView.isHidden = true
            playerTwoPoisonView.isHidden = true
            playerOnePreviousPoisonTotalTextView.isHidden = true
            playerTwoPreviousPoisonTotalTextView.isHidden = true
        }
        
        if counterViewsToLoad.contains("energy") {
            playerOneEnergyView.isHidden = false
            playerTwoEnergyView.isHidden = false
            playerOnePreviousEnergyTotalTextView.isHidden = false
            playerTwoPreviousEnergyTotalTextView.isHidden = false
            
        } else {
            playerOneEnergyView.isHidden = true
            playerTwoEnergyView.isHidden = true
            playerOnePreviousEnergyTotalTextView.isHidden = true
            playerTwoPreviousEnergyTotalTextView.isHidden = true
        }
        
        if counterViewsToLoad.contains("experience") {
            playerOneExperienceView.isHidden = false
            playerTwoExperienceView.isHidden = false
            playerOnePreviousExperienceTotalTextView.isHidden = false
            playerTwoPreviousExperienceTotalTextView.isHidden = false
        } else {
            playerOneExperienceView.isHidden = true
            playerTwoExperienceView.isHidden = true
            playerOnePreviousExperienceTotalTextView.isHidden = true
            playerTwoPreviousExperienceTotalTextView.isHidden = true
        }
    }
    
// IBOutlets
   
    @IBOutlet weak var playerOnePreviousLifeTotalTextView: UITextView!
    @IBOutlet weak var playerTwoPreviousLifeTotalTextView: UITextView!
    @IBOutlet weak var playerOnePreviousPoisonTotalTextView: UITextView!
    @IBOutlet weak var playerTwoPreviousPoisonTotalTextView: UITextView!
    @IBOutlet weak var playerOnePreviousEnergyTotalTextView: UITextView!
    @IBOutlet weak var playerTwoPreviousEnergyTotalTextView: UITextView!
    @IBOutlet weak var playerOnePreviousExperienceTotalTextView: UITextView!
    @IBOutlet weak var playerTwoPreviousExperienceTotalTextView: UITextView!
    
    @IBOutlet weak var playerOneNameLabel: UILabel!
    @IBOutlet weak var playerOneLifeTotalLabel: UILabel!
    @IBOutlet weak var playerOneLifeView: UIView!
    @IBOutlet weak var playerOnePoisonView: UIView!
    @IBOutlet weak var playerOneEnergyView: UIView!
    @IBOutlet weak var playerOneExperienceView: UIView!
    @IBOutlet weak var playerTwoLifeView: UIView!
    @IBOutlet weak var playerTwoPoisonView: UIView!
    @IBOutlet weak var playerTwoEnergyView: UIView!
    @IBOutlet weak var playerTwoExperienceView: UIView!
    
    @IBOutlet weak var playerOneSwitchPreviousCounterViewButton: UIButton!
    @IBOutlet weak var playerTwoSwitchPreviousCounterViewButton: UIButton!
    
    @IBOutlet weak var playerOnePreviousCounterSuperView: UIView!
    @IBOutlet weak var playerTwoPreviousCounterSuperView: UIView!
    
// IBActions
    @IBAction func playerOneUpButton(_ sender: UIButton) {
        playerOne.previousLifeTotals.append(playerOne.lifeTotal)
        updatePlayerOneLifeTotalHistory()
        playerOne.lifeTotal = playerOne.lifeTotal + 1
        playerOneLifeTotalLabel.text = String(playerOne.lifeTotal)
    }
    
    @IBAction func playerOneDownButton(_ sender: UIButton) {
        playerOne.previousLifeTotals.append(playerOne.lifeTotal)
        updatePlayerOneLifeTotalHistory()
        playerOne.lifeTotal = playerOne.lifeTotal - 1
        playerOneLifeTotalLabel.text = String(playerOne.lifeTotal)
    }

    @IBOutlet weak var playerTwoNameLabel: UILabel!

    @IBOutlet weak var playerTwoLifeTotalLabel: UILabel!
    
    @IBAction func playerTwoUpButton(_ sender: UIButton) {
        playerTwo.previousLifeTotals.append(playerTwo.lifeTotal)
        updatePlayerTwoLifeTotalHistory ()
        playerTwo.lifeTotal = playerTwo.lifeTotal + 1
        playerTwoLifeTotalLabel.text = String(playerTwo.lifeTotal)
    }
    @IBAction func playerTwoDownButton(_ sender: UIButton){
        playerTwo.previousLifeTotals.append(playerTwo.lifeTotal)
        updatePlayerTwoLifeTotalHistory ()
        playerTwo.lifeTotal = playerTwo.lifeTotal - 1
        playerTwoLifeTotalLabel.text = String(playerTwo.lifeTotal)
    }
    
// poison tracking
    @IBOutlet weak var playerOnePoisonTotalLabel: UILabel!
    
    @IBAction func playerOnePoisonUpButton(_ sender: Any) {
        playerOne.previousPoisonTotals.append(playerOne.poisonTotal)
        updatePlayerOnePoisonTotalHistory ()
        playerOne.poisonTotal = playerOne.poisonTotal + 1
        playerOnePoisonTotalLabel.text = String(playerOne.poisonTotal)
    }
    @IBAction func playerOnePoisonDownButton(_ sender: Any) {
        playerOne.previousPoisonTotals.append(playerOne.poisonTotal)
        updatePlayerOnePoisonTotalHistory ()
        playerOne.poisonTotal = playerOne.poisonTotal - 1
        playerOnePoisonTotalLabel.text = String(playerOne.poisonTotal)
    }
    @IBOutlet weak var playerTwoPoisonTotalLabel: UILabel!
    
    @IBAction func playerTwoPoisonUpButton(_ sender: Any) {
        playerTwo.previousPoisonTotals.append(playerTwo.poisonTotal)
        updatePlayerOnePoisonTotalHistory ()
        playerTwo.poisonTotal = playerTwo.poisonTotal + 1
        playerTwoPoisonTotalLabel.text = String(playerTwo.poisonTotal)
    }
    
    @IBAction func playerTwoPoisonDownButton(_ sender: Any) {
        playerTwo.previousPoisonTotals.append(playerTwo.poisonTotal)
        updatePlayerTwoPoisonTotalHistory ()
        playerTwo.poisonTotal = playerTwo.poisonTotal - 1
        playerTwoPoisonTotalLabel.text = String(playerTwo.poisonTotal)
    }
// energy tracking
    @IBOutlet weak var playerOneEnergyTotalLabel: UILabel!
    @IBAction func playerOneEnergyUpButton(_ sender: Any) {
        playerOne.previousEnergyTotals.append(playerOne.energyTotal)
        updatePlayerOneEnergyTotalHistory ()
        playerOne.energyTotal = playerOne.energyTotal + 1
        playerOneEnergyTotalLabel.text = String(playerOne.energyTotal)
    }
    @IBAction func playerOneEnergyDownButton(_ sender: Any) {
        playerOne.previousEnergyTotals.append(playerOne.energyTotal)
        updatePlayerOneEnergyTotalHistory ()
        playerOne.energyTotal = playerOne.energyTotal - 1
        playerOneEnergyTotalLabel.text = String(playerOne.energyTotal)
    }
    @IBOutlet weak var playerTwoEnergyTotalLabel: UILabel!
    @IBAction func playerTwoEnergyUpButton(_ sender: Any) {
        playerTwo.previousEnergyTotals.append(playerTwo.energyTotal)
        updatePlayerTwoEnergyTotalHistory ()
        playerTwo.energyTotal = playerTwo.energyTotal + 1
        playerTwoEnergyTotalLabel.text = String(playerTwo.energyTotal)
    }
    @IBAction func playerTwoEnergyDownButton(_ sender: Any) {
        playerTwo.previousEnergyTotals.append(playerTwo.energyTotal)
        updatePlayerTwoEnergyTotalHistory ()
        playerTwo.energyTotal = playerTwo.energyTotal - 1
        playerTwoEnergyTotalLabel.text = String(playerTwo.energyTotal)
    }
// experience tracking
    @IBOutlet weak var playerOneExperienceTotalLabel: UILabel!
    @IBAction func playerOneExperienceUpButton(_ sender: Any) {
        playerOne.previousExperienceTotals.append(playerOne.experienceTotal)
        updatePlayerOneExperienceTotalHistory ()
        playerOne.experienceTotal = playerOne.experienceTotal + 1
        playerOneExperienceTotalLabel.text = String(playerOne.experienceTotal)
    }
    @IBAction func playerOneExperienceDownButton(_ sender: Any) {
        playerOne.previousExperienceTotals.append(playerOne.experienceTotal)
        updatePlayerOneExperienceTotalHistory ()
        playerOne.experienceTotal = playerOne.experienceTotal - 1
        playerOneExperienceTotalLabel.text = String(playerOne.experienceTotal)
    }
    @IBOutlet weak var playerTwoExperienceTotalLabel: UILabel!
    @IBAction func playerTwoExperienceUpButton(_ sender: Any) {
        playerTwo.previousExperienceTotals.append(playerTwo.experienceTotal)
        updatePlayerTwoExperienceTotalHistory ()
        playerTwo.experienceTotal = playerTwo.experienceTotal + 1
        playerTwoExperienceTotalLabel.text = String(playerTwo.experienceTotal)
    }
    @IBAction func playerTwoExperienceDownButton(_ sender: Any) {
        playerTwo.previousExperienceTotals.append(playerTwo.experienceTotal)
        updatePlayerTwoExperienceTotalHistory ()
        playerTwo.experienceTotal = playerTwo.experienceTotal - 1
        playerTwoExperienceTotalLabel.text = String(playerTwo.experienceTotal)
    }
    
    
    
    
    
    
    
    
// previous lifeTotal/poisonTotal/energyTotal/experienceTotal sliding displays
    func updatePlayerOneLifeTotalHistory () {
        playerOne.lifeHistoryStringArray.append(String(playerOne.previousLifeTotals[playerOne.previousLifeTotals.count - 1]))
        playerOne.lifeHistory = playerOne.lifeHistoryStringArray.joined(separator: "\n \n")
        playerOnePreviousLifeTotalTextView.text = playerOne.lifeHistory
    }
    
    func updatePlayerTwoLifeTotalHistory () {
        playerTwo.lifeHistoryStringArray.append(String(playerTwo.previousLifeTotals[playerTwo.previousLifeTotals.count - 1]))
        playerTwo.lifeHistory = playerTwo.lifeHistoryStringArray.joined(separator: "\n \n")
        playerTwoPreviousLifeTotalTextView.text = playerTwo.lifeHistory
    }
    func updatePlayerOnePoisonTotalHistory () {
        playerOne.poisonHistoryStringArray.append(String(playerOne.previousPoisonTotals[playerOne.previousPoisonTotals.count - 1]))
        playerOne.poisonHistory = playerOne.poisonHistoryStringArray.joined(separator: "\n \n")
        playerOnePreviousPoisonTotalTextView.text = playerOne.poisonHistory
    }
    func updatePlayerTwoPoisonTotalHistory () {
        playerTwo.poisonHistoryStringArray.append(String(playerTwo.previousPoisonTotals[playerTwo.previousPoisonTotals.count - 1]))
        playerTwo.poisonHistory = playerTwo.poisonHistoryStringArray.joined(separator: "\n \n")
        playerTwoPreviousPoisonTotalTextView.text = playerTwo.poisonHistory
    }
    func updatePlayerOneEnergyTotalHistory () {
        playerOne.energyHistoryStringArray.append(String(playerOne.previousEnergyTotals[playerOne.previousEnergyTotals.count - 1]))
        playerOne.energyHistory = playerOne.energyHistoryStringArray.joined(separator: "\n \n")
        playerOnePreviousEnergyTotalTextView.text = playerOne.energyHistory
    }
    func updatePlayerTwoEnergyTotalHistory () {
        playerTwo.energyHistoryStringArray.append(String(playerTwo.previousEnergyTotals[playerTwo.previousEnergyTotals.count - 1]))
        playerTwo.energyHistory = playerTwo.energyHistoryStringArray.joined(separator: "\n \n")
        playerTwoPreviousEnergyTotalTextView.text = playerTwo.energyHistory
    }
    func updatePlayerOneExperienceTotalHistory () {
        playerOne.experienceHistoryStringArray.append(String(playerOne.previousExperienceTotals[playerOne.previousExperienceTotals.count - 1]))
        playerOne.experienceHistory = playerOne.experienceHistoryStringArray.joined(separator: "\n \n")
        playerOnePreviousExperienceTotalTextView.text = playerOne.experienceHistory
    }
    func updatePlayerTwoExperienceTotalHistory () {
        playerTwo.experienceHistoryStringArray.append(String(playerTwo.previousExperienceTotals[playerTwo.previousExperienceTotals.count - 1]))
        playerTwo.experienceHistory = playerTwo.experienceHistoryStringArray.joined(separator: "\n \n")
        playerTwoPreviousExperienceTotalTextView.text = playerTwo.experienceHistory
    }
// swith previous counter total views
    func playerOneMultipleTap(_ sender: UIButton, event: UIEvent) {
        let touch: UITouch = event.allTouches!.first!
        if (touch.tapCount == 2) {
            //playerOnePreviousCounterSuperView.sendSubview(toBack: <#T##UIView#>)
        }
    }
    func playerTwoMultipleTap(_ sender: UIButton, event: UIEvent) {
        let touch: UITouch = event.allTouches!.first!
        if (touch.tapCount == 2) {
            //playerTwoPreviousCounterSuperView.sendSubview(toBack: <#T##UIView#>)
            // TODO:do action
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerOneNameLabel.text = "Player One"
        playerTwoNameLabel.text = "Player Two"
        playerOneLifeTotalLabel.text = String(playerOne.lifeTotal)
        playerTwoLifeTotalLabel.text = String(playerTwo.lifeTotal)
        
        if counterViewsToLoad.contains("poison") {
            
        } else {
            playerOnePoisonView.isHidden = true
            playerTwoPoisonView.isHidden = true
            playerOnePreviousPoisonTotalTextView.isHidden = true
            playerTwoPreviousPoisonTotalTextView.isHidden = true
        }
        if counterViewsToLoad.contains("energy") {
            
        } else {
            playerOneEnergyView.isHidden = true
            playerTwoEnergyView.isHidden = true
            playerOnePreviousEnergyTotalTextView.isHidden = true
            playerTwoPreviousEnergyTotalTextView.isHidden = true
        }
        if counterViewsToLoad.contains("experience") {
            
        } else {
            playerOneExperienceView.isHidden = true
            playerTwoExperienceView.isHidden = true
            playerOnePreviousExperienceTotalTextView.isHidden = true
            playerTwoPreviousExperienceTotalTextView.isHidden = true
        }
        
        playerOneSwitchPreviousCounterViewButton.addTarget(self, action: #selector(playerOneMultipleTap(_:event:)), for: UIControlEvents.touchDownRepeat)
        
        playerTwoSwitchPreviousCounterViewButton.addTarget(self, action: #selector(playerTwoMultipleTap(_:event:)), for: UIControlEvents.touchDownRepeat)

        


        
//        var playerOneLifeViewConstraintWidth = NSLayoutConstraint (item: playerOneLifeView,
//                                                            attribute: NSLayoutAttribute.width,
//                                                            relatedBy: NSLayoutRelation.equal,
//                                                            toItem: nil,
//                                                            attribute: NSLayoutAttribute.notAnAttribute,
//                                                            multiplier: 1,
//                                                            constant: 100)
//        playerOneLifeView.addConstraint(playerOneLifeViewConstraintWidth)
//        
//        
//        
//        
//        playerOneLifeViewConstraintWidth.constant = 0
//        
//        NSLayoutConstraint(item: playerOneLifeView,
//                           attribute: .width,
//                           relatedBy: .equal,
//                           toItem: nil,
//                           attribute: .leading,
//                           multiplier: 1,
//                           constant: 1000).isActive = true
        
        
     
        
        //make it so that playerOneLifeTotalLabel.text = playerOne.lifeTotal
        //better yet, convert the lifeTotalLabel (and other things) to a property controlled by the class Player
        
        }
  


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toOptionsViewControllerSegue" {
            let optionsViewController = segue.destination as! OptionsViewController
            optionsViewController.previousViewController = self
            optionsViewController.trueValuedCounterBoolsArray = counterViewsToLoad
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
//extension UIView {
//    
//    public func addConstaintsToSuperview(leftOffset: CGFloat, topOffset: CGFloat) {
//        
//        self.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint(item: self,
//                           attribute: .leading,
//                           relatedBy: .equal,
//                           toItem: self.superview,
//                           attribute: .leading,
//                           multiplier: 1,
//                           constant: leftOffset).isActive = true
//        
//        NSLayoutConstraint(item: self,
//                           attribute: .top,
//                           relatedBy: .equal,
//                           toItem: self.superview,
//                           attribute: .top,
//                           multiplier: 1,
//                           constant: topOffset).isActive = true
//    }
//    
//    public func addConstaints(height: CGFloat, width: CGFloat) {
//        
//        self.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint(item: self,
//                           attribute: .height,
//                           relatedBy: .equal,
//                           toItem: nil,
//                           attribute: .notAnAttribute,
//                           multiplier: 1,
//                           constant: height).isActive = true
//        
//        
//        NSLayoutConstraint(item: self,
//                           attribute: .width,
//                           relatedBy: .equal,
//                           toItem: nil,
//                           attribute: .notAnAttribute,
//                           multiplier: 1,
//                           constant: width).isActive = true
//    }
//}
