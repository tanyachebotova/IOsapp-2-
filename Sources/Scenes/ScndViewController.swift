import UIKit

protocol ScndViewControllerDelagate: AnyObject {
    func setText(_ text: String)
}

final class ScndViewController: UIViewController {

    // MARK: - Properties

    var name: String?
    weak var delegate: ScndViewControllerDelagate?

    // MARK: - Subviews

    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Назад", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(.init { [weak self] _ in
            self?.goBack()
        }, for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Methods

    private func configureUI() {
        view.backgroundColor = .white

        view.addSubview(backButton)

        NSLayoutConstraint.activate([
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 44),
            backButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 120)
        ])
    }

    private func goBack() {
        let finalName = name?.trimmingCharacters(in: .whitespacesAndNewlines)
        let greeting: String
        if let finalName, !finalName.isEmpty {
            greeting = "Hello, \(finalName)"
        } else {
            greeting = "Hello"
        }

        delegate?.setText(greeting)
        navigationController?.popViewController(animated: true)
    }
}
