//
//  ViewController.swift
//  ticTacToe
//
//  Created by Kevin O'Connell on 11/18/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gridView: UIView!
    @IBOutlet weak var labOne: GridLabel!
    @IBOutlet weak var labTwo: GridLabel!
    @IBOutlet weak var labThree: GridLabel!
    @IBOutlet weak var labFour: GridLabel!
    @IBOutlet weak var labFive: GridLabel!
    @IBOutlet weak var labSix: GridLabel!
    @IBOutlet weak var labSeven: GridLabel!
    @IBOutlet weak var labEight: GridLabel!
    @IBOutlet weak var labNine: GridLabel!
    
    var labelsArray : [GridLabel] = []
    var myGrid = GridLabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        labelsArray = [labOne, labTwo, labThree, labFour, labFive, labSix, labSeven, labEight, labNine]
    }

    @IBAction func screenTapped(_ sender: UITapGestureRecognizer) {
   print("Screen tapped")
     
        for label in labelsArray
        {
        //iterate through labelsArray
            if label.frame.contains(sender.location(in: gridView))
            {
                if label.canTap == true
                {
                
                if myGrid.xTurn == true {
                
                    label.text = "🍑"   }
                else {
                    label.text = "🍆"
                }
                myGrid.xTurn = !myGrid.xTurn
                    label.canTap = false
                    myGrid.count += 1
                    print(myGrid.count)
                    
                }

            }
        }
        checkWinner()
    }
    func checkWinner() {
        if labOne.text == labTwo.text && labTwo.text == labThree.text && labOne.text != ""   {
            win(labOne.text!)
   print("Winner Winner Chicken Dinner.")
            
        }
    
    if labOne.text == labFour.text && labFour.text == labSeven.text && labOne.text != ""   {
       win(labOne.text!)
        print("Winner Winner Chicken Dinner.")
                        }
    
        if labOne.text == labFive.text && labFive.text == labNine.text && labOne.text != ""   {
          win(labOne.text!)
            print("Winner Winner Chicken Dinner.")
                                }
        
             if labThree.text == labFive.text && labFive.text == labSeven.text && labThree.text != ""   {
             win(labThree.text!)
                print("Winner Winner Chicken Dinner.")
                
            }
        
                if labFour.text == labFive.text && labFive.text == labSix.text && labFour.text != ""  {
                    win(labFour.text!)
 print("Winner Winner Chicken Dinner.")
                                                }
        
                     if labSeven.text == labEight.text && labEight.text == labNine.text  && labSeven.text != ""  {
                     win(labSeven.text!)
                        print("Winner Winner Chicken Dinner.")
                        
                    }
        
                        if labTwo.text == labFive.text && labFive.text == labEight.text && labTwo.text != ""   {
                          win(labTwo.text!)
                            print("Winner!")
                            
                        }
                        
                           if labThree.text == labSix.text && labSix.text == labNine.text && labThree.text != ""  {
                                win(labThree.text!)
                            print("Winner Winner")
                            
                }
        if myGrid.count == 9 {
            win("No One ")
            
        }
    }
    func win(_ winner:String)
    {
        //Displays Alert Controller
        let alert = UIAlertController(title:winner + "is the winner!", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        let resetButton = UIAlertAction(title: "play again", style: .default, handler: { (sender) in
            for labels in self.labelsArray
            {
            labels.text = ""
                labels.canTap = true
            }
            self.myGrid.xTurn = true
            self.myGrid.count = 0
        })
       alert.addAction(resetButton)
        present(alert, animated: true, completion: nil)
    }
}

