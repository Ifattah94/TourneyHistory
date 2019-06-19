//
//  HomeController.swift
//  tourneyHistory
//
//  Created by C4Q on 4/5/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    weak var delegate: HomeControllerDelegate?
    let homeView = HomeView()
    var tap: UITapGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(homeView)
        self.tap = UITapGestureRecognizer(target: self, action: #selector(handleExpansion))
        self.view.addGestureRecognizer(tap)
        view.backgroundColor = .white
        configureNavigationBar()
        configureCollectionView()
    }
    
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    @objc func handleExpansion() {
        delegate?.handleTapForExpansion()
    }
    
    private func configureCollectionView() {
        homeView.tourneyCollectionView.dataSource = self
        homeView.tourneyCollectionView.delegate = self
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_white_3x").withRenderingMode(.alwaysOriginal) , style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    

}
extension HomeController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeView.tourneyCollectionView.dequeueReusableCell(withReuseIdentifier: homeView.cellID, for: indexPath) as! TourneyCell
        cell.backgroundColor = .red
        return cell
    }
    
    
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width , height: self.view.frame.height * 0.30)
    }
}
