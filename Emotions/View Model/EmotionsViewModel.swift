//
//  EmotionsViewModel.swift
//  Emotions
//
//  Created by Jaylen Smith on 11/14/23.
//

import Foundation

protocol EmotionsDelegate: AnyObject {
    func didReceiveEmotions(_ emotions: [Emotion])
}

final class EmotionsViewModel: NSObject {
    
    var emotions = [Emotion]() {
        didSet {
            delegate?.didReceiveEmotions(emotions)
        }
    }
    
    weak var delegate: EmotionsDelegate?
    
    override init() {
        super.init()
        self.getEmotions()
    }
    
    
    func getEmotions() {
        
    }
    
    func saveNewEmotion(_ emotion: Emotion) {
        
    }
}
