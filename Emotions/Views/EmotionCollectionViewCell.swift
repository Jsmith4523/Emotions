//
//  EmotionCollectionViewCell.swift
//  Emotions
//
//  Created by Jaylen Smith on 11/14/23.
//

import UIKit

class EmotionCollectionViewCell: UICollectionViewCell {
    
    //MARK: Label
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //MARK: Action
    @IBAction func moreButton(_ sender: Any) {
        
    }
    
    var emotion: Emotion! {
        didSet {
            self.configureCellView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func configureCellView() {
        self.backgroundColor = emotion.feeling.color
        self.emojiLabel.text = emotion.feeling.emoji
        self.descriptionLabel.text = emotion.description
    }
}
