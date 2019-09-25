//
//  Card.swift
//  CardGame
//
//  Created by Suman Chatterjee on 24/09/2019.
//  Copyright © 2019 Suman Chatterjee. All rights reserved.
//

import Foundation
enum Rank: Int {
    case Ace = 1, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
    
    static func rankValue(for value:String) -> Rank {
        switch value {
        case "A": return Rank.Ace
        case "2": return Rank.Two
        case "3": return Rank.Three
        case "4": return Rank.Four
        case "5": return Rank.Five
        case "6": return Rank.Six
        case "7": return Rank.Seven
        case "8": return Rank.Eight
        case "9": return Rank.Nine
        case "10": return Rank.Ten
        case "J": return Rank.Jack
        case "Q": return Rank.Queen
        case "K": return Rank.King
        default:
            break
        }
        return Rank.Ace
    }
}

struct Card:Decodable {
    let value:String
    let suit: String
    var rank: Rank {
        return Rank.rankValue(for: value)
    }
}
