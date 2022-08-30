//
//  HomeViewController.swift
//  Parking
//
//  Created by Usr_Prime on 23/08/22.
//

import UIKit

class HomeViewController: DefaultViewController {

    private lazy var welcomeUser = ParkingHeaderView()
    
    private lazy var statusParking = ParkingStatusView()
    
    private lazy var parkingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.width/2.4), height: (view.frame.width/3)-10)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(VacancyCollectionViewCell.self, forCellWithReuseIdentifier: VacancyCollectionViewCell.identifier)
        collectionView.backgroundColor = Colors.darkGrey
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let faixa = ParkingSeparatorView(color: .white)
        
        collectionView.addSubview(faixa)
        
        faixa.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor).isActive = true
        faixa.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor).isActive = true
        faixa.widthAnchor.constraint(equalToConstant: 2).isActive = true
        faixa.heightAnchor.constraint(equalToConstant: ((view.frame.width/3)-10)*6).isActive = true
        
        return collectionView
    }()
    
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.addSubview(welcomeUser)
        view.addSubview(statusParking)
        view.addSubview(parkingCollectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            welcomeUser.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.width/9),
            welcomeUser.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            welcomeUser.widthAnchor.constraint(equalToConstant: view.frame.width-20),
            
            statusParking.topAnchor.constraint(equalTo: welcomeUser.bottomAnchor, constant: 70),
            statusParking.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusParking.widthAnchor.constraint(equalToConstant: view.frame.width),
            statusParking.heightAnchor.constraint(equalToConstant: 40),
            
            parkingCollectionView.topAnchor.constraint(equalTo: statusParking.bottomAnchor),
            parkingCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            parkingCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            parkingCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height-20),
            parkingCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.parking.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VacancyCollectionViewCell.identifier, for: indexPath) as? VacancyCollectionViewCell
        else { return UICollectionViewCell() }
        let index = indexPath.row
        cell.configureCell(position: index, vacancy: viewModel.parking[index])
        return cell
    }
}


