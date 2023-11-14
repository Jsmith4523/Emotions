//
//  ViewController.swift
//  Emotions
//
//  Created by Jaylen Smith on 11/13/23.
//

import UIKit

class EmotionsViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let viewModel = EmotionsViewModel()
    private var emotions = [Emotion]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.getEmotions()
        self.configureNavigationView()
        self.configureScrollView()
    }
    
    private func configureNavigationView() {
        let composeButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(presentComposeEmotionView))
        navigationController?.navigationBar.tintColor = .white
        navigationItem.rightBarButtonItem = composeButton
    }
    
    private func configureScrollView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = .init(width: view.frame.size.width, height: view.frame.size.height)
        layout.minimumLineSpacing = 0
        layout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(UINib(nibName: "EmotionCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "Emotion")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ComposeView":
            let navigationController = segue.destination as! UINavigationController
            let composeVC = navigationController.topViewController as! EmotionComposeViewController
            composeVC.viewModel = viewModel
        default:
            break
        }
    }
    
    @objc
    private func presentComposeEmotionView() {
        performSegue(withIdentifier: "ComposeView", sender: nil)
    }
}

//MARK: - UICollectionViewDataSource
extension EmotionsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emotions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Emotion", for: indexPath) as! EmotionCollectionViewCell
        cell.emotion = emotions[indexPath.row]
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension EmotionsViewController: UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }
}

//MARK: - EmotionsDelegate
extension EmotionsViewController: EmotionsDelegate {
    func didReceiveEmotions(_ emotions: [Emotion]) {
        self.emotions = emotions
        if emotions.isEmpty {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                //Give the application a moment to load up the current view controller; else will present warning of detached view controller
                self.performSegue(withIdentifier: "ComposeView", sender: nil)
            }
        }
    }
}
