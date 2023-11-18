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
            self.delegate?.didReceiveEmotions(emotions)
        }
    }
    
    weak var delegate: EmotionsDelegate?
    private let manager = UsersEmotionManager.shared
    
    override init() {
        super.init()
    }
    
    func getEmotions() {
        let emotions = manager.getUsersEmotions()
        self.emotions = emotions
    }
    
    func saveNewEmotion(_ emotion: Emotion, completion: @escaping () -> ()) throws {
        try manager.saveEmotion(emotion) { [weak self] in
            self?.getEmotions()
            completion()
        }
    }
    
    func deleteEmotion(_ emotion: Emotion) {
        
    }
}
