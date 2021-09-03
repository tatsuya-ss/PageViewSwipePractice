//
//  PageViewController.swift
//  PageViewSwipePractice
//
//  Created by 坂本龍哉 on 2021/09/02.
//

import UIKit

final class PageViewController: UIPageViewController {

    private var controllers = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupPageViewController()
        
    }
    
    private func setupPageViewController() {
        let allVC = PostViewController.instantiate()
        let followVC = PostViewController.instantiate()
        self.dataSource = self
        controllers = [allVC, followVC]
        setViewControllers([controllers[0]],
                           direction: .forward,
                            animated: true,
                            completion: nil)
    }
    
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        self.controllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = controllers.firstIndex(of: viewController) else { return nil }
          if index > 0 { return controllers[index - 1] }
        return nil
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = controllers.firstIndex(of: viewController) else { return nil }
          if index < controllers.count - 1 { return controllers[index + 1] }
        return nil
        
    }
    
    
}
