import UIKit

final class FstViewController: UIViewController {

    // MARK: - Properties

    private let presetName: String = "Tatyana"

    // MARK: - Subviews

    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Ввести имя", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(.init { [weak self] _ in
            self?.goNext()
        }, for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Methods

    private func configureUI() {
        title = "First"
        view.backgroundColor = .white

        view.addSubview(label)
        view.addSubview(button)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),

            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 24),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 44),
            button.widthAnchor.constraint(greaterThanOrEqualToConstant: 160)
        ])
    }

    private func goNext() {
        let controller = ScndViewController()
        controller.title = "Second"
        controller.name = presetName
        controller.delegate = self
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension FstViewController: ScndViewControllerDelagate {
    func setText(_ text: String) {
        label.text = text
    }
}
