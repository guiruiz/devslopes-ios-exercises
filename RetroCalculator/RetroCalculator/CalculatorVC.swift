//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Guilherme Ruiz on 15/12/16.
//  Copyright © 2016 Guilherme Ruiz. All rights reserved.
//

import UIKit
import AVFoundation

class CalculatorVC: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var buttonSound: AVAudioPlayer!
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    var leftValString = ""
    var rightValString = ""
    var result = ""
    
    var currentOperation = Operation.Empty
    var runningNumber = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do{
            try buttonSound = AVAudioPlayer(contentsOf: soundURL)
            buttonSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    @IBAction func numberPressed(sender: UIButton){
        playSound()
        runningNumber += "\(sender.tag)"
        outputLabel.text = runningNumber
    }
    
    @IBAction func onDividePressed(sender: UIButton){
        processOperation(operation: Operation.Divide)
    }
    
    
    @IBAction func onMultiplyPressed(sender: UIButton){
        processOperation(operation: Operation.Multiply)
        
    }
    
    
    @IBAction func onSubtractPressed(sender: UIButton){
        processOperation(operation: Operation.Subtract)
        
    }
    
    
    @IBAction func onAddPressed(sender: UIButton){
        processOperation(operation: Operation.Add)
        
    }
    
    @IBAction func onEqualPressed(sender: UIButton){
        processOperation(operation: currentOperation)
        
    }
    
    @IBAction func onClearPressed(_ sender: Any) {
        //clear calculator
    }
    
    func playSound(){
        if buttonSound.isPlaying {
            buttonSound.stop()
        }
        buttonSound.play()
    }
    
    func processOperation(operation: Operation){
        playSound()
        if(currentOperation != Operation.Empty){
            if runningNumber != ""{
                rightValString = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValString)! * Double(rightValString)!)"
                } else if currentOperation == Operation.Divide{
                    result = "\(Double(leftValString)! / Double(rightValString)!)"
                } else if currentOperation == Operation.Subtract{
                    result = "\(Double(leftValString)! - Double(rightValString)!)"
                } else  if currentOperation == Operation.Add{
                    result = "\(Double(leftValString)! + Double(rightValString)!)"
                }
                leftValString = result
                outputLabel.text = result
            }
            currentOperation = operation
        } else {
            leftValString = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }

    
}

