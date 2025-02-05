import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    private let pages : [OnboardingPage] = [
        OnboardingPage(imageName: "onboarding_welcome",
                       title: "Добро пожаловать!",
                       description: "Откройте новые возможности с нашим приложением. Всё, что вам нужно, в одном месте."),
        OnboardingPage(imageName: "onboarding_shopping",
                       title: "Легко и быстро",
                       description: "Выбирайте товары и оформляйте заказы за пару кликов. Удобный интерфейс для вашего комфорта."),
        OnboardingPage(imageName: "onboarding_notifications",
                       title: "Будьте в курсе",
                       description: "Получайте мгновенные уведомления о новых предложениях, скидках и статусе ваших заказов.")
    ]
    
    private var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        setViewControllers([createViewController(at: 0)], direction: .forward, animated: true, completion: nil)
    }
    
    func createViewController(at index: Int) -> OnbordingViewController {
        let vc = OnbordingViewController(page: pages[index])
        vc.isLastPage = (index == pages.count - 1) 
        vc.delegate = self
        return vc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard currentIndex > 0 else {return nil}
        return createViewController(at: currentIndex - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard currentIndex < pages.count - 1 else { return nil }
        return createViewController(at: currentIndex + 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed,
            let currentVC = viewControllers?.first as? OnbordingViewController,
            let newIndex = pages.firstIndex(where: { $0.title == currentVC.page.title }) {
            currentIndex = newIndex
        }
    }
}


extension PageViewController: OnboardingDelegate {
    func didFinishOnboarding() {
        UserDefaults.standard.set(true, forKey: "hasSeenOnboarding")
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        sceneDelegate?.setRootViewController()
    }
}
