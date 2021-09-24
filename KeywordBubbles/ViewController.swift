//
//  ViewController.swift
//  KeywordBubbles
//
//  Created by Cachy on 23/09/21.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    private var magnetic: Magnetic!
    
//    lazy private var scrollView: UIScrollView = {
//        let scrollView = UIScrollView(frame: self.view.bounds)
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.showsHorizontalScrollIndicator = false
//        scrollView.contentInsetAdjustmentBehavior = .never
//        return scrollView
//    }()
//
//    lazy private var scrollContentView: UIView = {
//        let contentView = UIView()
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//        return contentView
//    }()
    
    lazy private var skView: SKView = {
        let skView = SKView(frame: UIScreen.main.bounds)
        skView.backgroundColor = .white

        let magneticView = MagneticView(frame: skView.bounds)
        self.magnetic = magneticView.magnetic
        self.magnetic.numberOfSelections = 3
        self.magnetic.magneticDelegate = self

        skView.addSubview(magneticView)

        return skView
    }()
    
//    private var skView: SKView!
    
    lazy private var button: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .lightGray.withAlphaComponent(0.8)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.showAlert), for: .touchUpInside)
        return button
    }()
    
    private var keywords = [String]()
    
    private let colors: [UIColor] = [
        .red,
        .orange,
        .magenta,
        .purple,
        .systemPink,
        .systemTeal,
        .systemIndigo
    ]
    
//    private var scrollContentWidthConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(self.skView)
//        self.scrollView.addSubview(self.scrollContentView)
        self.view.insertSubview(self.button, aboveSubview: self.skView)
        
        for _ in 0..<10 {
            self.keywords.append(contentsOf: ["Foodie Talks", "Cricket test match", "Holiday memories or dream vacation?"])
        }
        
        self.keywords.append(contentsOf: [
            "Football",
            "iPhone 13 Pro Max",
            "Cyberhub",
            "Foodie Talks",
            "Work from Home",
            "Holiday memories or dream vacations?",
            "Cachy",
            "90s memories",
            "COVID-19",
            "Believe in love?",
            "If I were invisible for a day",
            "Chhole Bhature",
            "Delhi's Night Life",
            "Butter Chicken",
            "MacBook Pro",
            "Musical Melodies",
            "Certified Lover Boy",
            "U Block",
            "My dream job",
            "Bankaks",
            "Bangkok"
        ])
        
//        self.scrollContentWidthConstraint = NSLayoutConstraint(item: self.scrollContentView, attribute: .width, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(self.keywords.count) * 40)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for keyword in self.keywords {
            
            var radius = CGFloat(40)
            var image = UIImage(named: "tick_small")
            
            if keyword.count > 15 {
                radius = 60
                image = UIImage(named: "tick_medium")
            } else if keyword.count > 22 {
                radius = 80
                image = UIImage(named: "tick_large")
            }
            
            self.magnetic.addChild(Node(text: keyword, image: image, color: colors.randomElement()!, radius: radius, marginScale: 1.1))
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self.button, attribute: .leading, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: self.button, attribute: .centerX, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self.button, attribute: .bottom, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: -20),
            NSLayoutConstraint(item: self.button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60),
            
//            NSLayoutConstraint(item: self.scrollView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0),
//            NSLayoutConstraint(item: self.scrollView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0),
//            NSLayoutConstraint(item: self.scrollView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0),
//            NSLayoutConstraint(item: self.scrollView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0),
//
//            NSLayoutConstraint(item: self.scrollContentView, attribute: .leading, relatedBy: .equal, toItem: self.scrollView, attribute: .leading, multiplier: 1, constant: 0),
//            NSLayoutConstraint(item: self.scrollContentView, attribute: .trailing, relatedBy: .equal, toItem: self.scrollView, attribute: .trailing, multiplier: 1, constant: 0),
//            NSLayoutConstraint(item: self.scrollContentView, attribute: .top, relatedBy: .equal, toItem: self.scrollView, attribute: .top, multiplier: 1, constant: 0),
//            NSLayoutConstraint(item: self.scrollContentView, attribute: .bottom, relatedBy: .equal, toItem: self.scrollView, attribute: .bottom, multiplier: 1, constant: 0),
//            NSLayoutConstraint(item: self.scrollContentView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1, constant: 0),
//            self.scrollContentWidthConstraint
        ])
        
//        self.scrollView.setContentOffset(.init(x: (self.scrollContentView.bounds.width - UIScreen.main.bounds.width) / 2, y: 0), animated: false)
        
//        self.skView = SKView(frame: self.scrollContentView.bounds)
//        self.skView.backgroundColor = .white
//
//        let magneticView = MagneticView(frame: self.skView.bounds)
//        self.magnetic = magneticView.magnetic
//        self.magnetic.numberOfSelections = 6
//        self.magnetic.magneticDelegate = self
//
//        self.skView.addSubview(magneticView)
//        self.scrollContentView.addSubview(self.skView)
//
//        for keyword in self.keywords {
//
//            var radius = CGFloat(60)
//            var image = UIImage(named: "tick_small")
//
//            if keyword.count > 15 {
//                radius = 80
//                image = UIImage(named: "tick_medium")
//            } else if keyword.count > 22 {
//                radius = 100
//                image = UIImage(named: "tick_large")
//            }
//
//            self.magnetic.addChild(Node(text: keyword, image: image, color: colors.randomElement()!, radius: radius, marginScale: 1.1))
//        }
    }
    
    @objc
    private func showAlert() {
        let selectedNodes = self.magnetic.selectedChildren
        
        var message = ""
        for (index, node) in selectedNodes.enumerated() {
            message += "\(index + 1). \(node.text ?? "")\n"
        }
        _ = message.popLast()
        
        let alert = UIAlertController(title: "\(selectedNodes.count) keywords selected", message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: MagneticDelegate {
    
    func magnetic(_ magnetic: Magnetic, didSelect node: Node) {
        self.button.backgroundColor = .systemBlue
        self.button.isUserInteractionEnabled = true
    }
    
    func magnetic(_ magnetic: Magnetic, didDeselect node: Node) {
        if magnetic.selectedChildren.count == 0 {
            self.button.backgroundColor = .lightGray.withAlphaComponent(0.8)
            self.button.isUserInteractionEnabled = false
        }
    }
}
