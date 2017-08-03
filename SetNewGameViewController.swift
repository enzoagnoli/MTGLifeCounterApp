//
//  SetNewGameViewController.swift
//  MTG Life Counter
//
//  Created by Enzo Agnoli on 7/19/17.
//  Copyright © 2017 Enzo Agnoli. All rights reserved.
//

import UIKit

class SetNewGameViewController: UIViewController {
    var numberOfPlayers: Int!
    var startingLifeTotal: Int!
    
    @IBOutlet weak var setStartingLifeTotalSegmentedControlOutlet: UISegmentedControl!
    @IBOutlet weak var setNumberOfPlayersSegmentedControlOutlet: UISegmentedControl!
    @IBOutlet weak var numberOfPlayersLabel: UILabel!
    @IBOutlet weak var startingLifeTotalLabel: UILabel!
    @IBOutlet weak var playerOneNameChangeTextField: UITextField!
    @IBOutlet weak var playerTwoNameChangeTextField: UITextField!
    
    
    @IBAction func setStartingLifeTotalSegmentedControlAction(_ sender: Any) {
        let selectedStartingLifeTotalSegmentIndex = setStartingLifeTotalSegmentedControlOutlet.selectedSegmentIndex

        switch selectedStartingLifeTotalSegmentIndex {
        case 0:
            startingLifeTotal = 20
        case 1:
            startingLifeTotal = 30
        case 2:
            startingLifeTotal = 40
        case 3:
            //show alert with textfield
            let selectCustomLifeTotalAlertController = UIAlertController(title: "Custom life total", message: "", preferredStyle: UIAlertControllerStyle.alert)
            selectCustomLifeTotalAlertController.addTextField()
            selectCustomLifeTotalAlertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
            
            let confirmSetCustomLifeTotalAction = UIAlertAction(title: "Set", style: UIAlertActionStyle.default, handler: { _ in
                    if let textField = selectCustomLifeTotalAlertController.textFields?[0],
                    let text = textField.text,
                    let customLifeTotal = Int(text) {
                        self.startingLifeTotal = customLifeTotal
                        
                        DispatchQueue.main.async {
                            self.startingLifeTotalLabel.text = String(self.startingLifeTotal)

                        }
                }
            })
            selectCustomLifeTotalAlertController.addAction(confirmSetCustomLifeTotalAction)
            present(selectCustomLifeTotalAlertController, animated: true, completion: nil)
        default:
            break
        
        }
        startingLifeTotalLabel.text = String(startingLifeTotal)
    }
    
    @IBAction func setNumberOfPlayersSegmentedControlAction(_ sender: Any) {
        let selectedNumberOfPlayersSegmentIndex = setNumberOfPlayersSegmentedControlOutlet.selectedSegmentIndex
            
        switch selectedNumberOfPlayersSegmentIndex {
        case 0:
            numberOfPlayers = 1
            playerTwoNameChangeTextField.isHidden = true
        case 1:
            numberOfPlayers = 2
            playerTwoNameChangeTextField.isHidden = false
        default:
            break
        }
        numberOfPlayersLabel.text = String(numberOfPlayers)
    }
    override func viewDidLoad() {
        numberOfPlayersLabel.text = String(2)
        startingLifeTotalLabel.text = String(20)
        numberOfPlayers = 2
        startingLifeTotal = 20
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let lifeManagementViewController = segue.destination as! LifeManagementViewController
        lifeManagementViewController.playerOne.lifeTotal = startingLifeTotal
        lifeManagementViewController.playerTwo.lifeTotal = startingLifeTotal
        if playerOneNameChangeTextField.text == nil {
            lifeManagementViewController.playerOne.name = "Player One"
        } else {
            lifeManagementViewController.playerOne.name = playerOneNameChangeTextField.text!
        }
        if playerTwoNameChangeTextField.text == nil {
            lifeManagementViewController.playerTwo.name = "Player Two"
        } else {
            lifeManagementViewController.playerTwo.name = playerTwoNameChangeTextField.text!
        }
    }
}
