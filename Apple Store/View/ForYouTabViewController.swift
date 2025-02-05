import UIKit

class ForYouTabViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: Показ Анимации Загрузки
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !UserDefaults.standard.bool(forKey: "hasShownSplash") {
            let splashVC = SplashBarViewController()
            splashVC.modalPresentationStyle = .fullScreen
            present(splashVC, animated: false)
            
            UserDefaults.standard.set(true, forKey: "hasShownSplash")
        }
    }
    
    //MARK: Настройка таббара в белый
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let tabBar = tabBarController?.tabBar {
            tabBar.barTintColor = .white
            tabBar.tintColor = .systemBlue
            tabBar.unselectedItemTintColor = .black
        }
    }
    
    //MARK: Возврат таббара в черный
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let tabBar = tabBarController?.tabBar {
            tabBar.barTintColor = .black
            tabBar.tintColor = .systemBlue
            tabBar.unselectedItemTintColor = .white
        }
    }
    
    //MARK: Объявление переменных
    
    private let mainLabel : UILabel = {
        let label = UILabel()
        label.text = "Для вас"
        label.font = UIFont.boldSystemFont(ofSize: 34)
        label.textColor = .black
        return label
    }()
    
    private let avatarImg : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "person.circle")
        img.tintColor = .systemRed
        return img
    }()
    
    private let separator : UIView = {
        let separator = UIView()
        separator.backgroundColor = .systemGray6
        return separator
    }()
    
    private let newLabel : UILabel = {
        let label = UILabel()
        label.text = "Вот что нового"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .black
        return label
    }()
    
    private let orderView = UIView()
    
    private let recomendLabel : UILabel = {
        let label = UILabel()
        label.text = "Рекомендуется вам"
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.textColor = .black
        return label
    }()
    
    private let notificationImage : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "app.badge")
        img.tintColor = .systemRed
        return img
    }()
    
    private let boldNotificationLabel : UILabel = {
        let label = UILabel()
        label.text = "Получайте новости о своем заказе в режиме реального времению"
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private let grayNotificationLabel : UILabel = {
        let label = UILabel()
        label.text = "Включите уведомдения, чтобы получать новости о своем заказе."
        label.numberOfLines = 0
        label.textColor = .gray
        return label
    }()
    
    private let devicesLabel : UILabel = {
        let label = UILabel()
        label.text = "Ваши устройства"
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.textColor = .black
        return label
    }()
    
    private let devicesButton = UIButton()
    
    //MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupOrderView()
        setupUI()
        if let imageData = UserDefaults.standard.data(forKey: "avatarImage"),
            let image = UIImage(data: imageData) {
            avatarImg.image = image
        }
        avatarImg.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        avatarImg.addGestureRecognizer(tapGesture)
    }
    
    //MARK: настройка выбора Иконки
    
    @objc private func chooseImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: false, completion: nil)
        if let selectedImage = info[.originalImage] as? UIImage {
            if let imageData = selectedImage.jpegData(compressionQuality: 0.8) {
                UserDefaults.standard.set(imageData, forKey: "avatarImage")
            }
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: false, completion: nil)
    }
    
    //MARK: настройка orderView
    
    private func setupOrderView() {
        let orderImage: UIImageView = {
            let img = UIImageView()
            img.image = UIImage(named: "airpods")
            img.contentMode = .scaleAspectFit
            return img
        }()

        let deliveryStatusLabel: UILabel = {
            let label = UILabel()
            label.text = "Ваш заказ отправлен."
            label.textColor = .black
            return label
        }()

        let amountItemsLabel: UILabel = {
            let label = UILabel()
            label.text = "1 товар, доставка завтра"
            label.textColor = .gray
            return label
        }()

        let separator: UIView = {
            let separator = UIView()
            separator.backgroundColor = .systemGray6
            return separator
        }()

        let deliveryProgressBar: UIProgressView = {
            let progress = UIProgressView()
            progress.progress = 0.5
            progress.progressTintColor = .green
            progress.trackTintColor = .gray
            return progress
        }()

        let pretendingLabel: UILabel = {
            let label = UILabel()
            label.text = "Обрабатывается"
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 12) // Уменьшаем размер
            return label
        }()

        let shippedLabel: UILabel = {
            let label = UILabel()
            label.text = "Отправлен"
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 12)
            return label
        }()

        let deliveredLabel: UILabel = {
            let label = UILabel()
            label.text = "Доставлено"
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 12)
            return label
        }()

        [orderImage, deliveryStatusLabel, amountItemsLabel, separator, deliveryProgressBar, pretendingLabel, shippedLabel, deliveredLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            orderView.addSubview($0)
        }

        NSLayoutConstraint.activate([
            // Картинка слева
            orderImage.leadingAnchor.constraint(equalTo: orderView.leadingAnchor, constant: 10),
            orderImage.topAnchor.constraint(equalTo: orderView.topAnchor, constant: 10),
            orderImage.widthAnchor.constraint(equalTo: orderView.widthAnchor, multiplier: 0.2), // Сжимаем картинку, чтобы влез текст
            orderImage.heightAnchor.constraint(equalTo: orderView.heightAnchor, multiplier: 0.6),

            // Статус заказа
            deliveryStatusLabel.topAnchor.constraint(equalTo: orderView.topAnchor, constant: 10),
            deliveryStatusLabel.leadingAnchor.constraint(equalTo: orderImage.trailingAnchor, constant: 10),
            deliveryStatusLabel.trailingAnchor.constraint(equalTo: orderView.trailingAnchor, constant: -10),

            // Количество товаров
            amountItemsLabel.topAnchor.constraint(equalTo: deliveryStatusLabel.bottomAnchor, constant: 5),
            amountItemsLabel.leadingAnchor.constraint(equalTo: orderImage.trailingAnchor, constant: 10),
            amountItemsLabel.trailingAnchor.constraint(equalTo: orderView.trailingAnchor, constant: -10),

            // Разделитель
            separator.topAnchor.constraint(equalTo: amountItemsLabel.bottomAnchor, constant: 8),
            separator.leadingAnchor.constraint(equalTo: orderView.leadingAnchor, constant: 10),
            separator.trailingAnchor.constraint(equalTo: orderView.trailingAnchor, constant: -10),
            separator.heightAnchor.constraint(equalToConstant: 1),

            // Прогресс-бар
            deliveryProgressBar.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 8),
            deliveryProgressBar.leadingAnchor.constraint(equalTo: orderView.leadingAnchor, constant: 10),
            deliveryProgressBar.trailingAnchor.constraint(equalTo: orderView.trailingAnchor, constant: -10),

            // Метки статуса доставки
            pretendingLabel.topAnchor.constraint(equalTo: deliveryProgressBar.bottomAnchor, constant: 4),
            pretendingLabel.leadingAnchor.constraint(equalTo: deliveryProgressBar.leadingAnchor),

            shippedLabel.topAnchor.constraint(equalTo: deliveryProgressBar.bottomAnchor, constant: 4),
            shippedLabel.centerXAnchor.constraint(equalTo: deliveryProgressBar.centerXAnchor),

            deliveredLabel.topAnchor.constraint(equalTo: deliveryProgressBar.bottomAnchor, constant: 4),
            deliveredLabel.trailingAnchor.constraint(equalTo: deliveryProgressBar.trailingAnchor)
        ])
    }

    
    //MARK: настройка остального UI

    private func setupUI() {
        let elements = [
            mainLabel, avatarImg, separator, newLabel, orderView,
            recomendLabel, notificationImage, boldNotificationLabel, grayNotificationLabel,
            devicesLabel, devicesButton
        ]
        
        elements.forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            // Заголовок "Для вас"
            mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            // Аватарка
            avatarImg.centerYAnchor.constraint(equalTo: mainLabel.centerYAnchor),
            avatarImg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            avatarImg.widthAnchor.constraint(equalToConstant: 40),
            avatarImg.heightAnchor.constraint(equalToConstant: 40),

            // Разделитель
            separator.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10),
            separator.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1),

            // Заголовок "Вот что нового"
            newLabel.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 20),
            newLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            // Order View (карточка заказа)
            orderView.topAnchor.constraint(equalTo: newLabel.bottomAnchor, constant: 10),
            orderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            orderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            orderView.heightAnchor.constraint(equalToConstant: 120), // Сделал выше, чтобы все элементы влезли

            // Заголовок "Рекомендуется вам"
            recomendLabel.topAnchor.constraint(equalTo: orderView.bottomAnchor, constant: 30),
            recomendLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            // Иконка уведомлений
            notificationImage.topAnchor.constraint(equalTo: recomendLabel.bottomAnchor, constant: 10),
            notificationImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            notificationImage.widthAnchor.constraint(equalToConstant: 30),
            notificationImage.heightAnchor.constraint(equalToConstant: 30),

            // Основной текст уведомления
            boldNotificationLabel.topAnchor.constraint(equalTo: recomendLabel.bottomAnchor, constant: 10),
            boldNotificationLabel.leadingAnchor.constraint(equalTo: notificationImage.trailingAnchor, constant: 10),
            boldNotificationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            // Дополнительный текст уведомления
            grayNotificationLabel.topAnchor.constraint(equalTo: boldNotificationLabel.bottomAnchor, constant: 5),
            grayNotificationLabel.leadingAnchor.constraint(equalTo: notificationImage.trailingAnchor, constant: 10),
            grayNotificationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            // Заголовок "Ваши устройства"
            devicesLabel.topAnchor.constraint(equalTo: grayNotificationLabel.bottomAnchor, constant: 30),
            devicesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            // Кнопка "Показать все"
            devicesButton.centerYAnchor.constraint(equalTo: devicesLabel.centerYAnchor),
            devicesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }


    
}
