//
//  DefaultGameSelectionViewController.swift
//  tourneyHistory
//
//  Created by C4Q on 3/29/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import UIKit

class DefaultGameSelectionViewController: UIViewController {

    @IBOutlet weak var gamesCollectionView: UICollectionView!
    
    @IBOutlet weak var gamesLabel: UILabel!
    
    @IBOutlet weak var submitButton: UIButton!
    
    
    var gameViewModels = [DefaultGameViewModel]()
    let cellID = "defaultGameCell"
    let cellSpacing = UIScreen.main.bounds.size.width * 0.001
    private var usersession: UserSession!
    
    
    var selectedDefaultGameModels: [DefaultGameViewModel] = [] {
        didSet {
            var strArr = [String]()
            for vm in selectedDefaultGameModels {
                strArr += [vm.subtitle]
            }
            gamesLabel.text = strArr.joined(separator: " ")
        
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubmitButton()
        usersession = (UIApplication.shared.delegate as! AppDelegate).usersession
        submitButton.isEnabled = true
        gamesCollectionView.allowsMultipleSelection = true
        let nib = UINib(nibName: "DefaultGameCell", bundle: nil)
        gamesCollectionView.register(nib, forCellWithReuseIdentifier: cellID)
        getGames()

    }
    
    private func presentHomeVC() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeVC")
        present(homeVC, animated: true, completion: nil)
    }
    
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        sender.transform = CGAffineTransform(scaleX: 0.6, y: 0.4)
        
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.40),
                       initialSpringVelocity: CGFloat(4.0),
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: {
                        sender.transform = CGAffineTransform.identity
        },
                       completion: { Void in(
                        DatabaseManager.addDefaultGames(defaultGameVM: self.selectedDefaultGameModels, userSession: self.usersession),
                        self.presentHomeVC()
                        
                        )  }
        )
        
    }
    

    fileprivate func setupSubmitButton() {
        submitButton.layer.borderWidth = 1
        submitButton.layer.borderColor = UIColor.black.cgColor
    }
    
    
    fileprivate func getGames() {
        DefaultGameManager.shared.fetchDefaultGames { (error, games) in
            if let error = error {
                print("failed to get games \(error)")
            }
            self .gameViewModels = games.map({return DefaultGameViewModel(game: $0)})
            self.gamesCollectionView.reloadData()
            self.selectedDefaultGameModels = Array.init(repeating: DefaultGameViewModel(game: DefaultGame.init(name: "Default", imageData: nil, abbreviation: "")), count:self.gameViewModels.count )
        }
    }
    
}
extension DefaultGameSelectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = gamesCollectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! DefaultGameCell
        let viewModel = gameViewModels[indexPath.row]
        cell.gameViewModel = viewModel
        return cell
    }
    
}

extension DefaultGameSelectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if let selectedItems = collectionView.indexPathsForSelectedItems {
            if selectedItems.contains(indexPath) {
                collectionView.deselectItem(at: indexPath, animated: true)
                return false
            }
        }
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedVM = gameViewModels[indexPath.row]
        selectedDefaultGameModels[indexPath.row] = selectedVM
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
          selectedDefaultGameModels[indexPath.row] = DefaultGameViewModel(game: DefaultGame.init(name: "Default", imageData: nil, abbreviation: ""))
        
    }
}

extension DefaultGameSelectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numCells: CGFloat = 1.65
        let numSpaces: CGFloat = numCells + 1
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        return CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / numCells, height: screenHeight * 0.30)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: 0, right: cellSpacing)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
}
