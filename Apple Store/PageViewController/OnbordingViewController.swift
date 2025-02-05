import UIKit

protocol OnboardingDelegate: AnyObject {
    func didFinishOnboarding()
}

class OnbordingViewController: UIViewController {
    
    let page: OnboardingPage
    weak var delegate: OnboardingDelegate?
    var isLastPage = false
    
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Начать", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(startTapped), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    init(page: OnboardingPage) {
        self.page = page
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isLastPage {
            startButton.isHidden = false
        }
        view.backgroundColor = .white
        setupViews()
    }
    
    @objc private func startTapped() {
        delegate?.didFinishOnboarding()
    }
    
    private func setupViews() {
        let image : UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: page.imageName)
            image.contentMode = .scaleAspectFit
            return image
        }()
        
        let titleLabel : UILabel = {
            let label = UILabel()
            label.text = page.title
            label.font = .boldSystemFont(ofSize: 34)
            label.textAlignment = .center
            return label
        }()
        
        let descriptionLabel : UILabel = {
            let label = UILabel()
            label.text = page.description
            label.font = .systemFont(ofSize: 20)
            label.textAlignment = .center
            label.numberOfLines = 0
            return label
        }()
        
        [image, titleLabel, descriptionLabel, startButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            image.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            titleLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            startButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            startButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
            
        ])
    }
    
}
