//
//  ViewController.swift
//  CircularAnimation
//
//  Created by Waseem Syed on 10/22/17.
//  Copyright © 2017 Waseem Syed. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    let transition = CircularTransition()
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitioningMode = .present
        transition.startingPoint = menuButton.center
        transition.circleColor = .white
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitioningMode = .dismiss
        transition.startingPoint = menuButton.center
        transition.circleColor = .white
        return transition
    }
    @IBOutlet weak var menuButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        menuButton.backgroundColor = .romioGreen
        menuButton.layer.cornerRadius = menuButton.frame.size.width / 2
        menuButton.clipsToBounds = true
        DispatchQueue.main.async {
            self.menuButton.sendActions(for: .touchUpInside)
        }
    }
    
    func showNewVC() {
        self.performSegue(withIdentifier: "customSegue", sender: self)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .custom
    }
}
