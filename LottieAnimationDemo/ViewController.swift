//
//  ViewController.swift
//  LottieAnimationDemo
//
//  Created by marco rodriguez on 18/10/22.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    @IBOutlet weak var onboardingAnimation: AnimationView!
    
    
    @IBOutlet weak var mapNav: AnimationView!
    @IBOutlet weak var wordlAnimation: AnimationView!
    
    
    let animationView = AnimationView()
    
    
    
    var namesAnimations = ["clouds", "mapnav", "mappin", "area", "location", "world"]
    var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onboardingAnimation.contentMode = .scaleAspectFit
        onboardingAnimation.loopMode = .loop
        
        wordlAnimation.loopMode = .playOnce
        wordlAnimation.contentMode = .scaleAspectFit
        
        mapNav.loopMode = .autoReverse
        mapNav.contentMode = .scaleAspectFit
        
        mapNav.play()
        wordlAnimation.play()
        onboardingAnimation.play()
        
        //gesture
        mapNav.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(changeScreen)))
        
    }
    
    @objc func didTapImage(){
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //random pictures
//        let wichAnimation = Int.random(in: 0..<6)
//        setupAnimation(index: wichAnimation)
//        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(changeScreen), userInfo: nil, repeats: false)
    }
    
    @objc func changeAnimation() {
        let wichAnimation = Int.random(in: 0..<6)
        setupAnimation(index: wichAnimation)
    }
    
    @objc func changeScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        vc.modalPresentationStyle = .automatic
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

