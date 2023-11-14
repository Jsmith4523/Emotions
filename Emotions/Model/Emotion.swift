//
//  Emotion.swift
//  Emotions
//
//  Created by Jaylen Smith on 11/13/23.
//

import Foundation
import UIKit

struct Emotion: Codable, Comparable {
    
    init(feeling: Feeling, description: String) {
        self.feeling = feeling
        self.description = description
        self.dateTimeInterval = Date.now.timeIntervalSince1970
    }
    
    let feeling: Feeling
    let description: String
    let dateTimeInterval: TimeInterval
    
    static func < (lhs: Emotion, rhs: Emotion) -> Bool {
        lhs.dateTimeInterval < rhs.dateTimeInterval
    }
    
    static func > (lhs: Emotion, rhs: Emotion) -> Bool {
        lhs.dateTimeInterval > rhs.dateTimeInterval
    }
}

enum Feeling: Codable, CaseIterable {
    
    case joyful, angry, sad, disgusted, fearful
    
    var title: String {
        switch self {
        case .joyful:
            return "Joyful"
        case .angry:
            return "Angry"
        case .sad:
            return "Sad"
        case .disgusted:
            return "Disgusted"
        case .fearful:
            return "Fearful"
        }
    }
    
    var emoji: String {
        switch self {
        case .joyful:
            return "😄"
        case .angry:
            return "😡"
        case .sad:
            return "😭"
        case .disgusted:
            return "😒"
        case .fearful:
            return "🫣"
        }
    }
    
    var color: UIColor {
        switch self {
        case .joyful:
            return .systemOrange
        case .angry:
            return .systemRed
        case .sad:
            return .systemBlue
        case .disgusted:
            return .systemGreen
        case .fearful:
            return .systemIndigo
        }
    }
    
    static func basedUponEmoji(_ emoji: String) -> Self? {
        return allCases.first(where: {$0.emoji == emoji})
    }
}
