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
    
    var color: UIColor! {
        didSet {
            self.backgroundColor = color
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
