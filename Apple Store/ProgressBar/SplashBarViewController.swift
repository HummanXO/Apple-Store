import UIKit

class SplashBarViewController: UIViewController {
    
    private let splashProgressView = UIProgressView()
    private var myProgressLabel = UILabel()
    private var progress: Float = 0.0
    private var myTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        splashProgressView.progress = 0.0
        view.alpha = 1
        view.backgroundColor = .white
        startTimer()
        setupLayouts(splashProgressView, myProgressLabel)
    }
    
    // MARK: Setup ProgressBar Logic
    private func startTimer() {
        myTimer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
    }
    @objc private func updateProgress() {
        progress += 0.01
        splashProgressView.progress = progress
        myProgressLabel.text = "\(Int(progress * 100))%"
        if progress >= 1.0 {
            myTimer?.invalidate()
            myTimer = nil
            UIView.animate(withDuration: 0.5, animations: {
                self.view.alpha = 0.0
            }, completion: { _ in
                self.dismiss(animated: false, completion: nil)
            })
        }
        
    }
    
    // MARK: Setup UI
    private func setupLayouts(_ progressView: UIProgressView, _ progressLabel: UILabel) {
        progressView.setProgress(progress, animated: false)
        progressView.progressTintColor = UIColor.black
        progressView.trackTintColor = UIColor.gray
        progressView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressView)
        
        progressLabel.textAlignment = .center
        progressLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressLabel)
        
        NSLayoutConstraint.activate([
            progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalToConstant: 5),
            
            progressLabel.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            progressLabel.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -50)
        ])
    }
}
