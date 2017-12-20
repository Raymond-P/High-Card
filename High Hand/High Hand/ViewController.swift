//
//  ViewController.swift
//  High Hand
//
//  Created by Raymond Perez on 12/16/17.
//  Copyright © 2017 Raymond Perez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var game: HighHand = HighHand()
    
    
    @IBOutlet var cardValueLabels: [UILabel]!
    
    @IBOutlet var cardSuitLabeld: [UILabel]!
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var betLabel: UILabel!
    
    @IBOutlet weak var betStepperBtn: UIStepper!
    @IBAction func betStepper(_ sender: UIStepper) {
        betLabel.text = String(sender.value)
    }
    
    @IBOutlet weak var drawButton: UIButton!
    
    
    @IBAction func pressDrawButn(_ sender: UIButton) {
        game.dealHands()
        updateCardsUI()
        
        
        betStepperBtn.isEnabled = true
        betStepperBtn.minimumValue = 1.0
        betStepperBtn.maximumValue = Double(game.Cash)
        balanceLabel.text = String(game.Cash)
        
        disableTradeButtons()
        initialBet.isEnabled = true
        comScore.text = "0"
        playerScore.text = "0"
        game.tradesLeft = 3
    }
    
//    @IBAction func drawBtn() {
//        game.dealHands()
//        updateCardsUI()
//        
//        betStepper.isEnabled = true
//        betStepper.minimumValue = 1.0
//        betStepper.maximumValue = Double(game.Cash)
//        balanceLabel.text = String(game.Cash)
//        
//        disableTradeButtons()
//        initialBet.isEnabled = true
//        
//    }
    
    func updateCardsUI(){
        let hand = game.playerHand
        for i in 0...4{
            cardValueLabels[i].text = hand[i]?.value.description()
            cardValueLabels[i].textColor = hand[i]?.getColor()
            cardSuitLabeld[i].text = hand[i]?.suit.description()
            
        }
    }
    
    @IBOutlet weak var initialBet: UIButton!
    
    @IBAction func InitialBet(_ sender: UIButton) {
        game.bet = Int(betStepperBtn.value)
        betStepperBtn.minimumValue = Double(game.bet)
        enableTradeButtons()
        sender.isEnabled = false
        finalBet.isEnabled = true
        
    }
    
    @IBOutlet weak var comScore: UILabel!
    
    @IBOutlet weak var playerScore: UILabel!
    
    
    @IBOutlet weak var finalBet: UIButton!
    
    @IBAction func finalBet(_ sender: UIButton) {
        
        initialBet.isEnabled = false
        game.bet = Int(betStepperBtn.value)
        
        let com_Score = game.getHandValue(of: game.comHand)
        comScore.text = String(com_Score)
        
        let player_Score = game.getHandValue(of: game.playerHand)
        playerScore.text = String(player_Score)
        
        var prize = -1*game.bet
        
        if player_Score > com_Score{
            prize = game.bet
            if player_Score > (com_Score*2){
                prize = prize*2
            }
        }
        
        game.Cash += prize
        
        balanceLabel.text = String(game.Cash)
        
        if(game.Cash < 1){
            drawButton.isEnabled = false
        }
        finalBet.isEnabled = false
        disableTradeButtons()
    
    }
    
    
    // Trade btns ///
    @IBOutlet var tradeButtons: [UIButton]!
    
    func disableTradeButtons(){
        for i in 0...4{
            tradeButtons[i].isEnabled = false
        }
    }
    
    func enableTradeButtons(){
        for i in 0...4{
            tradeButtons[i].isEnabled = true
        }
    }
    
    @IBAction func tradeBtn1(_ sender: UIButton) {
        cardTrade(index: 0, button: sender)
    }
    
    @IBAction func tradeBtn2(_ sender: UIButton) {
        cardTrade(index: 1, button: sender)
    }
    
    @IBAction func tradeBtn3(_ sender: UIButton) {
        cardTrade(index: 2, button: sender)
    }
    
    @IBAction func tradeBtn4(_ sender: UIButton) {
        cardTrade(index: 3, button: sender)
    }
    
    @IBAction func tradeBtn5(_ sender: UIButton) {
        cardTrade(index: 4, button: sender)
    }
    
    
    
    func cardTrade(index: Int, button sender: UIButton){
        if (game.tradesLeft > 0){
        game.playerHand[index] = game.deck.drawCard()
        updateCardsUI()
        game.tradesLeft -= 1
        sender.isEnabled = false
        }else{
            disableTradeButtons()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        betStepperBtn.isEnabled = false
        disableTradeButtons()
        finalBet.isEnabled = false
        initialBet.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

}

