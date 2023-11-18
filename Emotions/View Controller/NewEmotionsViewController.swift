//
//  NewEmotionsViewController.swift
//  Emotions
//
//  Created by Jaylen Smith on 11/14/23.
//

import UIKit

class NewEmotionsViewController: UIViewController {
    
    var viewModel: EmotionsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func button(_ sender: Any) {
        performSegue(withIdentifier: "ComposeView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ComposeView":
            let navigationController = segue.destination as! UINavigationController
            let composeVC = navigationController.topViewController as! EmotionComposeViewController
            composeVC.viewModel = viewModel
            composeVC.completion = dismissView
        default:
            break
        }
    }
    
    private func dismissView() {
        self.dismiss(animated: true)
    }
}
