//
//  HomeViewController.swift
//  Parking
//
//  Created by Usr_Prime on 23/08/22.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: DefaultViewController {

    private lazy var welcomeUser = ParkingHeaderView()
    private lazy var statusParking = ParkingStatusView()
    private lazy var menu = ParkingMenuView()
    private lazy var refreshControl = UIRefreshControl()
    
    public lazy var parkingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: (view.frame.width/2.4), height: (view.frame.width/3)-10)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.delegate = self
        collectionView.register(VacancyCollectionViewCell.self, forCellWithReuseIdentifier: VacancyCollectionViewCell.identifier)
        collectionView.backgroundColor = Colors.darkGrey
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)

        collectionView.addSubview(refreshControl)
        return collectionView
    }()
    
    let faixa = ParkingSeparatorView(color: .white)
    private lazy var bottomMessageView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.defaultBackground
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let messageLabel = ParkingLabel(content: "Escolha uma vaga para checkin ou checkout",
                                        size: 16,
                                        type: .darkGreyMessage)
        view.addSubview(messageLabel)
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        return view
    }()
    
    private let viewModel = HomeViewModel()
    private var bag = DisposeBag()
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getCars()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupUI()
        setupConstraints()
    }
    
    private func setupView() {
        viewModel.delegate = self
        
        addView(welcomeUser)
        addView(statusParking)
        addView(parkingCollectionView)
        addView(faixa)
        addView(menu)
        addView(bottomMessageView)
        
        // MARK: Configuração da CELL
        parkingCollectionView.rx.setDelegate(self).disposed(by: bag)
        viewModel.teste.bind(to: parkingCollectionView.rx.items(
            cellIdentifier: VacancyCollectionViewCell.identifier,
            cellType: VacancyCollectionViewCell.self)) { (row, item, cell) in
                cell.configureCell(position: row, vacancy: item)
        }.disposed(by: bag)
        
        // MARK: Configuração do delegate da CELL
        parkingCollectionView.rx.itemSelected.subscribe(onNext: { indexPath in
            print(indexPath.row)
            self.viewModel.showDetailsOF(indexCar: indexPath)
        }).disposed(by: bag)
    }
    
    private func setupUI() {
        navigationController?.navigationBar.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showOrHideMenu(_:))))
        statusParking.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showOrHideMenu(_:))))

        menu.profileButton.addTarget(self, action: #selector(self.openProfile), for: .touchUpInside)
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
            
            faixa.topAnchor.constraint(equalTo: statusParking.bottomAnchor),
            faixa.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            faixa.widthAnchor.constraint(equalToConstant: 2),
            faixa.heightAnchor.constraint(equalToConstant: view.frame.height-20),
            
            bottomMessageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomMessageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomMessageView.heightAnchor.constraint(equalToConstant: view.frame.width/6),
            bottomMessageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 25)
        ])
    }
    
    @objc func showOrHideMenu(_ sender: UITapGestureRecognizer) {
        if menu.isHidden { menu.isHidden = false }
        else { menu.isHidden = true }
    }
    @objc func openProfile() {
        menu.isHidden = true
        let profile = ProfileViewController()
        let rootController = UINavigationController(rootViewController: profile)
        rootController.modalPresentationStyle = .fullScreen
        present(rootController, animated: true)
    }
    @objc func exitScreen() {
        dismiss(animated: true, completion: nil)
    }
    @objc func refreshData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.viewModel.getCars()
            self.refreshControl.endRefreshing()
            self.refreshControl.isHidden = true
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        menu.isHidden = true
        let vacancy = viewModel.parking[indexPath.row]

        let statusVacancy = StatusVacancyViewController(vacancy: vacancy)
        let rootDetailController = UINavigationController(rootViewController: statusVacancy)
        statusVacancy.modalPresentationStyle = .overCurrentContext
        statusVacancy.viewModel.numVacancy = indexPath.row
        present(rootDetailController, animated: true)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.parking.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VacancyCollectionViewCell.identifier, for: indexPath) as? VacancyCollectionViewCell
        else { return UICollectionViewCell() }
        let index = indexPath.row
        cell.configureCell(position: index,
                           vacancy: viewModel.parking[index])

        return UICollectionViewCell()
    }
}

extension HomeViewController: HomeViewDelegate {
    func callStatusVacancy(with data: VacancyDetails) {
        //
    }
    
    func alertError(with message: String) {
//        alertDialog(title: "Erro de API",
//                    message: message,
//                    handler: { _ in self.viewModel.getCars() }
//        )
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.parkingCollectionView.reloadData()
            self.statusParking.vacanciesFilledValue.text = self.viewModel.getVacanciesFilled()
            self.statusParking.vacanciesAvailableValue.text = self.viewModel.getVacanciesAvailable()
            print(self.viewModel.parking.count)
        }
        print("ReloadData: \(self.viewModel.parking)")
    }
    
    func callStatusVacancy(with data: ParkingApiResponse) {
        let statusVacancy = StatusVacancyViewController(vacancy: data)
        let rootDetailController = UINavigationController(rootViewController: statusVacancy)
        statusVacancy.modalPresentationStyle = .overCurrentContext
//        statusVacancy.viewModel.numVacancy = indexPath.row
        self.present(rootDetailController, animated: true)
    }
}
