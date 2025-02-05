import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        setRootViewController() // ✅ Проверяем, что показывать
    }

    /// ✅ Метод для смены rootViewController (онбординг или главное окно)
    func setRootViewController() {
        let hasSeenOnboarding = UserDefaults.standard.bool(forKey: "hasSeenOnboarding")
        
        if hasSeenOnboarding {
            showMainApp() // ✅ Открываем TabBar
        } else {
            showOnboarding() // ✅ Показываем онбординг
        }
    }

    /// ✅ Метод для показа онбординга (если не пройден)
    func showOnboarding() {
        let onboardingVC = PageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        window?.rootViewController = onboardingVC
        window?.makeKeyAndVisible()
    }

    /// ✅ Метод для показа главного экрана (если онбординг пройден)
    func showMainApp() {
        let buyTVC = BuyTabViewController()
        buyTVC.tabBarItem = UITabBarItem(title: "Купить", image: UIImage(systemName: "laptopcomputer"), tag: 0)

        let forYouTVC = ForYouTabViewController()
        forYouTVC.tabBarItem = UITabBarItem(title: "Для вас", image: UIImage(systemName: "person.circle"), tag: 1)

        let searchTVC = UINavigationController(rootViewController: SearchTabViewController())
        searchTVC.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 2)

        let cartTVC = CartTabViewController()
        cartTVC.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "bag"), tag: 3)

        let tabBar = UITabBarController()
        tabBar.setViewControllers([buyTVC, forYouTVC, searchTVC, cartTVC], animated: true)
        tabBar.selectedViewController = buyTVC

        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().tintColor = .systemBlue
        UITabBar.appearance().unselectedItemTintColor = .white
        
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        UserDefaults.standard.set(false, forKey: "hasShownSplash")
    }
}
