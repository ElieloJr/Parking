//
//  StatusVacancyViewController.swift
//  Parking
//
//  Created by Usr_Prime on 02/09/22.
//

import UIKit
import TextFieldFormatter

class StatusVacancyViewController: KeyboardViewController {
    
    private lazy var viewBackground: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.defaultBackground
        view.layer.cornerRadius = 30
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var titleModal = ParkingLabel(content: "Cadastrar Veículo".uppercased(),
                                               size: Int(view.frame.width)/18,
                                               type: .darkGreyMessage)
    private lazy var ownerName = ParkingTextField(text: "Dono", type: .Normal)
    private lazy var model = ParkingTextField(text: "Modelo (Nome do Carro)", type: .Normal)
    private lazy var color = ParkingTextField(text: "Cor", type: .Normal)
    private lazy var licence = TextFieldFormatter(placeholder: "Placa - Comum", type: .License)
    private lazy var isMercosul = ParkingSwitch(stateStart: false)
    private lazy var isMercosulLabel = ParkingLabel(content: "Placa padrão Mercosul",
                                                    size: 16, type: .darkGreyMessage)
    private lazy var addCarButtom = ParkingButton(content: "Adicionar Carro",
                                                  type: .primary)
    
    private lazy var picker = UIPickerView()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let viewModel = StatusVacancyViewModel()
    
    convenience init(vacancy: VacancyDetails) {
        self.init()
        
        configureWithCar(with: vacancy)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupUI()
        configKeyboard()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .clear
        viewModel.delegate = self
        navigationController?.isNavigationBarHidden = true
        
        view.addSubview(viewBackground)
        
        viewBackground.addSubview(titleModal)
        viewBackground.addSubview(scrollView)
        
        scrollView.addSubview(ownerName)
        scrollView.addSubview(model)
        scrollView.addSubview(color)
        scrollView.addSubview(licence)
        scrollView.addSubview(isMercosul)
        scrollView.addSubview(isMercosulLabel)
        
        viewBackground.addSubview(addCarButtom)
    }
    
    private func setupUI() {
        color.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.showPicker(_:))))
        isMercosul.addTarget(self, action: #selector(setTextField), for: UIControl.Event.valueChanged)
        if !isMercosul.isHidden {
            addCarButtom.addTarget(self, action: #selector(self.registerCar), for: .touchUpInside)
        } else {
            addCarButtom.addTarget(self, action: #selector(self.checkoutCar), for: .touchUpInside)
        }
    }
    
    private func configKeyboard() {
        ownerName.returnKeyType = .next
        ownerName.delegate = self
        
        model.returnKeyType = .next
        model.delegate = self
        
        licence.returnKeyType = .done
        licence.delegate = self
    }
    
    private func setupConstraints() {
        let viewHeight = view.frame.height/2
        let width = view.frame.width
        
        if !isMercosul.isHidden {
            NSLayoutConstraint.activate([
                viewBackground.heightAnchor.constraint(equalToConstant: viewHeight),
                
                isMercosul.topAnchor.constraint(equalTo: licence.bottomAnchor, constant: width/40),
                isMercosul.leadingAnchor.constraint(equalTo: ownerName.leadingAnchor),
            
                isMercosulLabel.centerYAnchor.constraint(equalTo: isMercosul.centerYAnchor, constant: 2),
                isMercosulLabel.leadingAnchor.constraint(equalTo: isMercosul.trailingAnchor, constant: 10),
            ])
        } else {
            viewBackground.heightAnchor.constraint(equalToConstant: viewHeight-(width/9)).isActive = true
        }
        
        NSLayoutConstraint.activate([
            viewBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            titleModal.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: width/22),
            titleModal.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            scrollView.topAnchor.constraint(equalTo: titleModal.bottomAnchor, constant: width/50),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: addCarButtom.topAnchor),
            
            ownerName.topAnchor.constraint(equalTo: scrollView.topAnchor),
            ownerName.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: 20),
            ownerName.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: -20),
            ownerName.heightAnchor.constraint(equalToConstant: width/7),
            
            model.topAnchor.constraint(equalTo: ownerName.bottomAnchor, constant: width/40),
            model.leadingAnchor.constraint(equalTo: ownerName.leadingAnchor),
            model.trailingAnchor.constraint(equalTo: ownerName.trailingAnchor),
            model.heightAnchor.constraint(equalToConstant: width/7),
            
            color.topAnchor.constraint(equalTo: model.bottomAnchor, constant: width/40),
            color.leadingAnchor.constraint(equalTo: ownerName.leadingAnchor),
            color.trailingAnchor.constraint(equalTo: ownerName.trailingAnchor),
            color.heightAnchor.constraint(equalToConstant: width/7),
            
            licence.topAnchor.constraint(equalTo: color.bottomAnchor, constant: width/40),
            licence.leadingAnchor.constraint(equalTo: ownerName.leadingAnchor),
            licence.trailingAnchor.constraint(equalTo: ownerName.trailingAnchor),
            licence.heightAnchor.constraint(equalToConstant: width/7),
            licence.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50),
            
            addCarButtom.leadingAnchor.constraint(equalTo: ownerName.leadingAnchor),
            addCarButtom.trailingAnchor.constraint(equalTo: ownerName.trailingAnchor),
            addCarButtom.heightAnchor.constraint(equalToConstant: width/7),
            addCarButtom.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -width/12)
        ])
        
    }
    
    private func configureWithCar(with car: VacancyDetails) {
        if !car.isEmpty {
            self.titleModal.text = "Consultar Veículo".uppercased()
            self.ownerName.text = car.ownerName
            
            self.model.text = car.model
            self.color.text = car.color
            self.licence.text = car.licence
            self.isMercosul.isHidden = true
            self.isMercosulLabel.isHidden = true
            addCarButtom.setTitle("Fazer Checkout", for: .normal)
            
            self.ownerName.isUserInteractionEnabled = false
            self.model.isUserInteractionEnabled = false
            self.color.isUserInteractionEnabled = false
            self.licence.isUserInteractionEnabled = false
        }
    }
    @objc func showPicker(_ sender: UITapGestureRecognizer) {
        self.picker = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height/3))
        self.picker.delegate = self
        self.picker.dataSource = self
        self.picker.backgroundColor = UIColor.darkGray.withAlphaComponent(0.18)
        color.inputView = self.picker
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = Colors.blue
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Escolher", style: .plain, target: self, action: #selector(self.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(self.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        color.inputAccessoryView = toolBar
        
        DispatchQueue.main.async { [self] in self.picker.reloadAllComponents() }
    }
    
    @objc func doneClick() {
        if color.text != "" { color.resignFirstResponder() }
    }
    @objc func cancelClick() {
        color.resignFirstResponder()
        color.text = ""
    }
    @objc func setTextField(_ sender: UITapGestureRecognizer) {
        licence.text = ""
        if isMercosul.isOn {
            licence.placeholder = "Placa - Padrão Mercosul"
            licence.pattern = "CCCNCNN"
        } else {
            licence.placeholder = "Placa - Comum"
            licence.pattern = "CCC-NNNN"
        }
    }
    @objc func registerCar() {
        viewModel.validateFields(ownerName, model, color, licence, isMercosul)
    }
    
    @objc func checkoutCar() {
        dismiss(animated: true, completion: nil)
        print("Checkout realizado com sucesso!")
        // TODO: Call valueScreen
    }
}

extension StatusVacancyViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        color.text = viewModel.colors[row]
    }
}

extension StatusVacancyViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.colors.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(viewModel.colors[row])"
    }
}

extension StatusVacancyViewController: StatusVacancyViewDelegate {
    func showAlertIn(_ field: UITextField) {
        field.layer.borderColor = UIColor.red.cgColor
        field.layer.borderWidth = 2
    }
    func setToDefault() {
        ownerName.layer.borderWidth = 0
        model.layer.borderWidth = 0
        color.layer.borderWidth = 0
        licence.layer.borderWidth = 0
    }
    func callParking() {
        dismiss(animated: true, completion: nil)
    }
}

extension StatusVacancyViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == ownerName {
            ownerName.resignFirstResponder()
            model.becomeFirstResponder()
        } else if textField == model {
            model.resignFirstResponder()
        } else if textField == licence {
            licence.resignFirstResponder()
        }
        return true
    }
}
