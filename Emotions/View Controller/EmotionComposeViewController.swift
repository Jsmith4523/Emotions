//
//  EmotionComposeViewController.swift
//  Emotions
//
//  Created by Jaylen Smith on 11/14/23.
//

import UIKit

class EmotionComposeViewController: UIViewController {
    
    var viewModel: EmotionsViewModel!
    var completion: (()->())? = nil
    
    //MARK: Outlets
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var feelingPicker: UISegmentedControl!
    @IBOutlet weak var descriptionText: UITextView!
    
    //MARK: Actions
    @IBAction func pickerDidChangeValue(_ sender: UISegmentedControl) {
        self.emojiLabel.text = Feeling.allCases[sender.selectedSegmentIndex].emoji
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dismissButton = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(dismissView))
        self.navigationItem.leftBarButtonItem = dismissButton
        
        let saveButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveEmotion))
        self.navigationItem.rightBarButtonItem = saveButton
        
        self.configureView()
    }
    
    private func configureView() {
        feelingPicker.removeAllSegments()
        let feelings = Feeling.allCases
        for i in 0..<feelings.count {
            feelingPicker.insertSegment(withTitle: feelings[i].emoji, at: i, animated: false)
        }
        feelingPicker.selectedSegmentIndex = 0
    }
    
    @objc
    private func saveEmotion() {
        guard let selectedSegmentEmoji = feelingPicker.titleForSegment(at: feelingPicker.selectedSegmentIndex), let feeling = Feeling.basedUponEmoji(selectedSegmentEmoji) else {
            return
        }
        
        let emotion = Emotion(feeling: feeling, description: descriptionText.text)
        do {
            try viewModel.saveNewEmotion(emotion) { [weak self] in
                self?.dismissView()
            }
        } catch {
            self.presentErrorSavingEmotion()
        }
    }
    
    @objc
    private func dismissView() {
        dismiss(animated: true)
        completion?()
    }
    
    private func presentErrorSavingEmotion() {
        let ac = UIAlertController(title: "There was an issue saving your emotion.", message: "Please try again!", preferredStyle: .alert)
        let primaryAction = UIAlertAction(title: "OK", style: .default)
        ac.addAction(primaryAction)
        
        present(ac, animated: true)
    }
}
