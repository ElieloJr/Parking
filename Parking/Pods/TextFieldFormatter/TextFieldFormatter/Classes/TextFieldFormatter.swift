public enum TypeMask {
    case CNPF
    case Money
}

public class TextFieldFormatter: UITextField {
    
    public override var text: String? {
        didSet {
            if oldText != text {
                let lastText = text?.format(pattern, oldString: oldText) ?? ""
                oldText = lastText
                text = lastText
            }
        }
    }
    
    public var formattedText: String {
        return text ?? ""
    }
    
    public var unformattedText: String {
        return (text ?? oldText).unformat(pattern, oldString: oldText)
    }
    
    // MARK: - Inspectable
    @IBInspectable
    public var pattern: String = "" {
        didSet {
            oldText = ""
            formatText()
        }
    }
    
    // MARK: - Private Properties
    private var oldText: String = ""
    
    // MARK: - Init
    public convenience init(placeholder: String, type: TypeMask) {
        self.init(frame: .zero)
        
        switch type {
        case .CNPF:
            maskCNPJ()
        case .Money:
            maskMoney(placeholder: placeholder)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
        defaultLayout()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    public override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        commonInit()
    }
    
    private func commonInit() {
        removeTarget(self, action: #selector(textFieldDidChangeFormatter), for: .editingChanged)
        removeTarget(self, action: #selector(textFieldDidEndEditingFormatter), for: .editingDidEnd)
        removeTarget(self, action: #selector(textFieldDidChangeFormatter), for: .valueChanged)
        
        addTarget(self, action: #selector(textFieldDidChangeFormatter), for: .editingChanged)
        addTarget(self, action: #selector(textFieldDidEndEditingFormatter), for: .editingDidEnd)
        addTarget(self, action: #selector(textFieldDidChangeFormatter), for: .valueChanged)
    }
    
    private func defaultLayout() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.keyboardType = .numberPad
        self.autocapitalizationType = .words
        
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 2.0
        self.layer.shadowOffset = CGSize(width: 1, height: 3)
        self.layer.shadowColor = UIColor.black.cgColor
        
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        self.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        self.leftViewMode = .always
        self.rightViewMode = .always
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func maskCNPJ() {
        self.placeholder = "CNPJ"
        self.pattern = "NN.NNN.NNN/NNNN-nn"
        self.font = UIFont.init(name: "Arial", size: 20.0)
    }
    
    private func maskMoney(placeholder: String) {
        self.placeholder = placeholder
        self.pattern = "R$ nNN,NN"
        self.font = UIFont.init(name: "Arial", size: 20.0)
    }
    
    // MARK: - Observer Methods
    @objc private func textFieldDidChangeFormatter() {
        formatText()
    }
    
    @objc private func textFieldDidEndEditingFormatter() {
        formatText()
    }
    
    private func formatText() {
        self.text = text ?? ""
    }
}
