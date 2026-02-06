import UIKit

class ViewController: UIViewController {

    // MARK: - Constants
    
    private enum Constant {
        enum HelloLabel {
            static let width: CGFloat = 100.0
        }
    }
    
    // MARK: - Subviews
    
    private var helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .black
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var randomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Random", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addAction(
            UIAction { [weak self] _ in
                self?.setRandomImage()
            }, for: .touchUpInside
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: images[0])
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Properties
    
    let images: [String] = ["cat1", "cat2"]
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    deinit { }
    
    // MARK: - Methods
    
    private func configureView() {
        view.backgroundColor = .white
        
        view.addSubview(helloLabel)
        
        NSLayoutConstraint.activate([
            helloLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            helloLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            helloLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 50),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        view.addSubview(randomButton)
        
        NSLayoutConstraint.activate([
            randomButton.heightAnchor.constraint(equalToConstant: 32),
            randomButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            randomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            randomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36)
        ])
    }
    
    private func setRandomImage() {
        let randomNumber = Int.random(in: 0..<images.count)
        let imageName = images[randomNumber]
        imageView.image = UIImage(named: imageName)
    }
}

