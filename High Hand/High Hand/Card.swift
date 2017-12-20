//
//  Card.swift
//  High Hand
//
//  Created by Raymond Perez on 12/16/17.
//  Copyright © 2017 Raymond Perez. All rights reserved.
//

import Foundation
import UIKit

struct Card{
    
    var value: Value;
    var suit: Suit;
    var score: Double{
        get{
            return value.getValue()+(0.1)*suit.rank()
        }
    }
    
    init(cardValue: Double, cardSuit: Double ) {
        value = Value.init(rawValue: cardValue)!
        suit = Suit.init(rawValue: cardSuit)!
        print("Made card: \(self.simpleDescription())")
    }
    
    init(cardValue: Double, cardSuit: Suit) {
        value  = Value.init(rawValue: cardValue)!
        suit = cardSuit
        print("Made card: \(self.simpleDescription())")
    }
    
    func simpleDescription() -> String {
        let description = "\(value.description()) of \(suit.description())"
//        print("Made card: \(description)")
        return description
    }
    
    func getColor() -> UIColor{
        return suit.color()
    }
    
    enum Value: Double{
        // if the type is specified you can init the first and every following case will auto increment
        // Two = 2, Three = 3, Four = 4 ... Ace = 14
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace
        
        func getValue() -> Double{
            return self.rawValue
        }
        
        func description() -> String{
            switch self {
            case .Jack:
                return "J"
            case .Queen:
                return "Q"
            case .King:
                return "K"
            case .Ace:
                return "A"
            default:
                return String(format: "%.0f",self.rawValue)
            }
        }
    }
    
    enum Suit: Double{
        case Clubs = 1, Diamonds, Hearts, Spades
        
        func color() -> UIColor{
            switch self {
            case .Diamonds,.Hearts:
                return UIColor.red
            case .Clubs, .Spades:
                return UIColor.black
            }
        }
        
        func rank() -> Double {
           return self.rawValue
        }
        
        func description() -> String {
            switch self {
            case .Clubs:
                return "♣️"
            case .Diamonds:
                return "♦️"
            case .Hearts:
                return "♥️"
            case .Spades:
                return "♠️"
            }
        }
        
    }
    
    
    
    
}
