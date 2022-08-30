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
    
    private lazy var menu = ParkingMenuView()
    
    private lazy var parkingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
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
    
    private lazy var bottomMessageView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 40
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let messageLabel = ParkingLabel(content: "Escolha uma vaga para checkin ou checkout",
                                        size: 17, type: .darkGreyMessage)
        view.addSubview(messageLabel)
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        return view
    }()
    
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupUI()
        setupConstraints()
    }
    
    private func setupView() {
        view.addSubview(welcomeUser)
        view.addSubview(statusParking)
        view.addSubview(parkingCollectionView)
        view.addSubview(menu)
        view.addSubview(bottomMessageView)
    }
    
    private func setupUI() {
        navigationController?.navigationBar.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showOrHideMenu(_:))))
        statusParking.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showOrHideMenu(_:))))

        menu.exitButton.addTarget(self, action: #selector(self.exitScreen), for: .touchUpInside)
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
            
            menu.topAnchor.constraint(equalTo: statusParking.bottomAnchor),
            menu.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menu.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menu.heightAnchor.constraint(equalToConstant: 170),
            
            parkingCollectionView.topAnchor.constraint(equalTo: statusParking.bottomAnchor),
            parkingCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            parkingCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            parkingCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height-20),
            parkingCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            bottomMessageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomMessageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomMessageView.heightAnchor.constraint(equalToConstant: 50),
            bottomMessageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc func showOrHideMenu(_ sender: UITapGestureRecognizer) {
        if menu.isHidden { menu.isHidden = false }
        else { menu.isHidden = true }
    }
    
    @objc func exitScreen() {
        dismiss(animated: true, completion: nil)
    }
}

extension HomeViewController: UICollectionViewDelegate { }

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


