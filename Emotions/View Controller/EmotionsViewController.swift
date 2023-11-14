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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @objc
    private func presentComposeEmotionView() {
        
    }
}

extension EmotionsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Feeling.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Emotion", for: indexPath) as! EmotionCollectionViewCell
        cell.color = Feeling.allCases[indexPath.item].color
        return cell
    }
}

extension EmotionsViewController: UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }
}

