
public enum TypeMask {
    case CNPJ
    case Money1
    case Money2
    case License
    case Mercosul
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
    private let lightGrey = UIColor(red: 0.64, green: 0.64, blue: 0.64, alpha: 1.00)
    private let darkGrey = UIColor(red: 0.31, green: 0.33, blue: 0.31, alpha: 1.00)
    
    // MARK: - Init
    public convenience init(placeholder: String, type: TypeMask) {
        self.init(frame: .zero)
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: lightGrey]
            )
        
        switch type {
        case .CNPJ:
            self.pattern = "NN.NNN.NNN/NNNN-nn"
            
        case .Money1:
            self.pattern = "R$ NN,NN"
            
        case .Money2:
            self.pattern = "R$ NNN,NN"
            
        case .License:
            self.keyboardType = .default
            self.pattern = "CCC-NNNN"
            
        case .Mercosul:
            self.keyboardType = .default
            self.pattern = "CCCNCNN"
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
        self.textColor = darkGrey
        self.keyboardType = .numberPad
        self.autocapitalizationType = .words
        self.font = UIFont.init(name: "Arial", size: 20.0)
        
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
