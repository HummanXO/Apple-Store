    import UIKit

    class SearchTabViewController: UIViewController {
        
        private let searchLabel : UILabel = {
            let label = UILabel()
            label.text = "Поиск"
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
            return label
        }()
        
        private let searchTextField : UITextField = {
            let tf = UITextField()
            tf.placeholder = " 🔍 Поиск по продуктам и магазинам"
            tf.font = UIFont.systemFont(ofSize: 22)
            tf.layer.cornerRadius = 15
            tf.backgroundColor = .systemGray
            return tf
        }()
        
        private let recentlyViewsLabel : UILabel = {
            let label = UILabel()
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
            label.text = "Недавно просмотренные"
            return label
        }()
        
        private let resetButton : UIButton = {
            let button = UIButton(type: .roundedRect)
            button.setTitle("Отчистить", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            return button
        }()
        
        private let macBook: UIView = {
            let macBook = UIView()
            macBook.layer.cornerRadius = 10
            macBook.backgroundColor = UIColor.systemGray.withAlphaComponent(0.5) // Полупрозрачный фон (опционально)
            
            let image = UIImageView()
            image.image = UIImage(named: "macbook")
            image.contentMode = .scaleAspectFit
            image.translatesAutoresizingMaskIntoConstraints = false
            
            let label = UILabel()
            label.text = "Macbook Pro M3"
            label.textColor = .white
            label.numberOfLines = 0
            label.contentMode = .scaleAspectFill
            label.translatesAutoresizingMaskIntoConstraints = false
            
            macBook.addSubview(image)
            macBook.addSubview(label)
            
            NSLayoutConstraint.activate([
                image.topAnchor.constraint(equalTo: macBook.topAnchor, constant: 10),
                image.leadingAnchor.constraint(equalTo: macBook.leadingAnchor, constant: 10),
                image.trailingAnchor.constraint(equalTo: macBook.trailingAnchor, constant: -10), // Исправлено на -10
                image.heightAnchor.constraint(equalToConstant: 50),
                
                label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
                label.leadingAnchor.constraint(equalTo: macBook.leadingAnchor, constant: 10),
                label.trailingAnchor.constraint(equalTo: macBook.trailingAnchor, constant: -10), // Исправлено на -10
                label.bottomAnchor.constraint(equalTo: macBook.bottomAnchor, constant: -10)
            ])
            
            return macBook
        }()

        
        private let iPhone : UIView = {
            let iPhone = UIView()
            iPhone.layer.cornerRadius = 10
            let image = UIImageView()
            image.clipsToBounds = true
            image.image = UIImage(named: "iphone")
            image.contentMode = .scaleAspectFit
            let label = UILabel()
            label.textColor = .white
            label.text = "iPhone X"
            label.numberOfLines = 0
            label.contentMode = .scaleAspectFill
            iPhone.backgroundColor = .systemGray
            
            [image, label].forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                iPhone.addSubview($0)
            }
            
            NSLayoutConstraint.activate([
                image.topAnchor.constraint(equalTo: iPhone.topAnchor, constant: 10),
                image.leadingAnchor.constraint(equalTo: iPhone.leadingAnchor, constant: 10),
                image.trailingAnchor.constraint(equalTo: iPhone.trailingAnchor, constant: -10),
                image.heightAnchor.constraint(equalToConstant: 50),
                
                label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
                label.leadingAnchor.constraint(equalTo: iPhone.leadingAnchor, constant: 10),
                label.trailingAnchor.constraint(equalTo: iPhone.trailingAnchor, constant: -10),
                label.bottomAnchor.constraint(equalTo: iPhone.bottomAnchor, constant: -10)
            ])
            return iPhone
        }()
        
        private let appleWatch : UIView = {
            let appleWatch = UIView()
            appleWatch.layer.cornerRadius = 10
            let image = UIImageView()
            image.clipsToBounds = true
            image.image = UIImage(named: "applewatch")
            image.contentMode = .scaleAspectFit
            let label = UILabel()
            label.textColor = .white
            label.text = "Apple Watch"
            label.numberOfLines = 0
            label.contentMode = .scaleAspectFill
            appleWatch.backgroundColor = .systemGray
            
            [image, label].forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                appleWatch.addSubview($0)
            }
            
            NSLayoutConstraint.activate([
                image.topAnchor.constraint(equalTo: appleWatch.topAnchor, constant: 10),
                image.leadingAnchor.constraint(equalTo: appleWatch.leadingAnchor, constant: 10),
                image.trailingAnchor.constraint(equalTo: appleWatch.trailingAnchor, constant: -10),
                image.heightAnchor.constraint(equalToConstant: 50),
                
                label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
                label.leadingAnchor.constraint(equalTo: appleWatch.leadingAnchor, constant: 10),
                label.trailingAnchor.constraint(equalTo: appleWatch.trailingAnchor, constant: -10),
                label.bottomAnchor.constraint(equalTo: appleWatch.bottomAnchor, constant: -10)
            ])
            return appleWatch
        }()
        
        private let airPods : UIView = {
            let airPods = UIView()
            airPods.layer.cornerRadius = 10
            let image = UIImageView()
            image.clipsToBounds = true
            image.image = UIImage(named: "airpods")
            image.contentMode = .scaleAspectFit
            let label = UILabel()
            label.text = "Air Pods Pro"
            label.textColor = .white
            label.numberOfLines = 0
            label.contentMode = .scaleAspectFill
            airPods.backgroundColor = .systemGray
            
            [image, label].forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                airPods.addSubview($0)
            }
            
            NSLayoutConstraint.activate([
                image.topAnchor.constraint(equalTo: airPods.topAnchor, constant: 10),
                image.leadingAnchor.constraint(equalTo: airPods.leadingAnchor, constant: 10),
                image.trailingAnchor.constraint(equalTo: airPods.trailingAnchor, constant: -10),
                image.heightAnchor.constraint(equalToConstant: 50),
                
                label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
                label.leadingAnchor.constraint(equalTo: airPods.leadingAnchor, constant: 10),
                label.trailingAnchor.constraint(equalTo: airPods.trailingAnchor, constant: -10),
                label.bottomAnchor.constraint(equalTo: airPods.bottomAnchor, constant: -10)
            ])
            return airPods
        }()
        
        
        
        private let scrollView : UIScrollView = {
            let scroll = UIScrollView()
            return scroll
        }()
        
        private let contentView : UIView = {
            let view = UIView()
            return view
        }()

        override func viewDidLoad() {
            super.viewDidLoad()
            setupLayouts()
            setupContentView()
            view.backgroundColor = .black
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
            view.addGestureRecognizer(tapGesture)
        }
        
        @objc private func handleTap(_ gesture: UIGestureRecognizer) {
            let tapLocation = gesture.location(in: contentView)
            if macBook.frame.contains(tapLocation) {
                let productVC = productViewController()
                productVC.t = "macbook"
                productVC.loadURL = "https://www.apple.com/th-en/shop/buy-mac/macbook-pro"
                present(productVC, animated: true)
            }
        }
        
        private func setupLayouts() {
            [searchLabel, searchTextField, recentlyViewsLabel, resetButton, scrollView].forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                self.view.addSubview($0)
            }
            
            contentView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(contentView)
            
            NSLayoutConstraint.activate([
                searchLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30),
                searchLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
                
                searchTextField.topAnchor.constraint(equalTo: searchLabel.bottomAnchor, constant: 10),
                searchTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
                searchTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
                
                recentlyViewsLabel.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 25),
                recentlyViewsLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
                
                resetButton.centerYAnchor.constraint(equalTo: recentlyViewsLabel.centerYAnchor),
                resetButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
                
                scrollView.topAnchor.constraint(equalTo: recentlyViewsLabel.bottomAnchor, constant: 10),
                scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
                scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
                scrollView.heightAnchor.constraint(equalToConstant: 250),
                
                contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
            ])
        }
        
        private func setupContentView() {
            var previousView: UIView?

            let viewWidth = (view.bounds.width - 30) / 2.5

            for i in [macBook, iPhone, appleWatch, airPods] {
                i.translatesAutoresizingMaskIntoConstraints = false // Добавлено, чтобы Auto Layout работал
                contentView.addSubview(i)

                NSLayoutConstraint.activate([
                    i.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                    i.widthAnchor.constraint(equalToConstant: viewWidth),
                    i.heightAnchor.constraint(equalToConstant: 200)
                ])

                if let previous = previousView {
                    i.leadingAnchor.constraint(equalTo: previous.trailingAnchor, constant: 10).isActive = true
                } else {
                    i.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
                }

                previousView = i
            }

            if let lastView = previousView {
                lastView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
            }

            // Обязательно устанавливаем ширину `contentView`, чтобы `UIScrollView` знал, на сколько можно скроллить
            let totalWidth = (viewWidth * CGFloat(4)) + (10 * CGFloat(3))
            NSLayoutConstraint.activate([
                contentView.widthAnchor.constraint(equalToConstant: totalWidth)
            ])
        }
        
        
    }
