//
//  UsersEmotionManager.swift
//  Emotions
//
//  Created by Jaylen Smith on 11/14/23.
//

import Foundation

final class UsersEmotionManager {
    
    private let emotionsDataKey = "Emotions"
    
    enum UserEmotionManagerError: Error {
        case userDefaultsError
        case codableError
    }
    
    static let shared = UsersEmotionManager()
    
    private init() {}
    
    func getUsersEmotions() -> [Emotion] {
        do {
            let emotions = try getEmotions()
            return emotions.sorted(by: >)
        } catch {
            return []
        }
    }
    
    ///Get the current emotions from UserDefaults
    private func getEmotions() throws -> [Emotion] {
        guard let data = UserDefaults.standard.data(forKey: emotionsDataKey) else {
            return []
        }
        
        let emotions = try JSONDecoder().decode([Emotion].self, from: data)
        return emotions
    }
    
    func saveEmotion(_ emotion: Emotion, completion: @escaping () -> ()) throws {
        var currentEmotions = try getEmotions()
        currentEmotions.append(emotion)
        
        let data = try JSONEncoder().encode(currentEmotions)
        UserDefaults.standard.set(data, forKey: emotionsDataKey)
        completion()
    }
}
