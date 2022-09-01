//
//  RegisterVehicleViewController.swift
//  Parking
//
//  Created by Usr_Prime on 30/08/22.
//

import UIKit
import TextFieldFormatter

class RegisterVehicleViewController: DefaultViewController {
    
    private lazy var viewBackground: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.defaultBackground
        view.layer.cornerRadius = 30
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var titleModal = ParkingLabel(content: "Cadastrar Veículo".uppercased(),
                                               size: 20, type: .darkGreyMessage)
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
    
    let viewModel = RegisterVehicleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupUI()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .clear
        viewModel.delegate = self
        
        view.addSubview(viewBackground)
        
        viewBackground.addSubview(titleModal)
        viewBackground.addSubview(ownerName)
        viewBackground.addSubview(model)
        viewBackground.addSubview(color)
        viewBackground.addSubview(licence)
        viewBackground.addSubview(isMercosul)
        viewBackground.addSubview(isMercosulLabel)
        viewBackground.addSubview(addCarButtom)
    }
    
    private func setupUI() {
        color.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.showPicker(_:))))
        isMercosul.addTarget(self, action: #selector(setTextField), for: UIControl.Event.valueChanged)
        addCarButtom.addTarget(self, action: #selector(self.registerCar), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            viewBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewBackground.heightAnchor.constraint(equalToConstant: view.frame.height/2),
            viewBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            titleModal.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: 24),
            titleModal.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            ownerName.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: 60),
            ownerName.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: 20),
            ownerName.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: -20),
            ownerName.heightAnchor.constraint(equalToConstant: 50),
            
            model.topAnchor.constraint(equalTo: ownerName.bottomAnchor, constant: 10),
            model.leadingAnchor.constraint(equalTo: ownerName.leadingAnchor),
            model.trailingAnchor.constraint(equalTo: ownerName.trailingAnchor),
            model.heightAnchor.constraint(equalToConstant: 50),
            
            color.topAnchor.constraint(equalTo: model.bottomAnchor, constant: 10),
            color.leadingAnchor.constraint(equalTo: ownerName.leadingAnchor),
            color.trailingAnchor.constraint(equalTo: ownerName.trailingAnchor),
            color.heightAnchor.constraint(equalToConstant: 50),
            
            licence.topAnchor.constraint(equalTo: color.bottomAnchor, constant: 10),
            licence.leadingAnchor.constraint(equalTo: ownerName.leadingAnchor),
            licence.trailingAnchor.constraint(equalTo: ownerName.trailingAnchor),
            licence.heightAnchor.constraint(equalToConstant: 50),
            
            isMercosul.topAnchor.constraint(equalTo: licence.bottomAnchor, constant: 10),
            isMercosul.leadingAnchor.constraint(equalTo: ownerName.leadingAnchor),
            
            isMercosulLabel.centerYAnchor.constraint(equalTo: isMercosul.centerYAnchor, constant: 2),
            isMercosulLabel.leadingAnchor.constraint(equalTo: isMercosul.trailingAnchor, constant: 10),
            
            addCarButtom.topAnchor.constraint(equalTo: isMercosul.bottomAnchor, constant: 20),
            addCarButtom.leadingAnchor.constraint(equalTo: ownerName.leadingAnchor),
            addCarButtom.trailingAnchor.constraint(equalTo: ownerName.trailingAnchor),
            addCarButtom.heightAnchor.constraint(equalToConstant: 70)
        ])
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
}

extension RegisterVehicleViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        color.text = viewModel.colors[row]
    }
}

extension RegisterVehicleViewController: UIPickerViewDataSource {
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

extension RegisterVehicleViewController: RegisterVehicleViewDelegate {
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
