//
//  PostViewController.swift
//  PageViewSwipePractice
//
//  Created by 坂本龍哉 on 2021/09/02.
//

import UIKit

final class PostViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var backColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension UIViewController {
    
    static func instantiate() -> Self {
        var storyboardName = String(describing: self)
        if let result = storyboardName.range(of: "ViewController") {
            storyboardName.removeSubrange(result)
        } else {
            fatalError("Storyboardの名前が正しくない")
        }
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewController(
            identifier: String(describing: self)
        ) as! Self
        return vc
    }

}
