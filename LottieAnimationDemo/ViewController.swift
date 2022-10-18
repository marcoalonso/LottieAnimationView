//
//  ViewController.swift
//  LottieAnimationDemo
//
//  Created by marco rodriguez on 18/10/22.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    let animationView = AnimationView()
    
    var namesAnimations = ["clouds", "mapnav", "mappin", "area", "location", "world"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let wichAnimation = Int.random(in: 0..<6)
        setupAnimation(index: wichAnimation)
        
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(changeAnimation), userInfo: nil, repeats: false)
        
        
    }
    
    @objc func changeAnimation() {
        let wichAnimation = Int.random(in: 0..<6)
        setupAnimation(index: wichAnimation)
    }
    
    @objc func changeScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }

    func setupAnimation(index: Int){
        animationView.animation = Animation.named(namesAnimations[index])
        animationView.frame = view.bounds
        animationView.backgroundColor = .white
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
    }

}

