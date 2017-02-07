//
//  ViewController.swift
//  ScrollViewsSample
//
//  Created by Guilherme Ruiz on 14/12/16.
//  Copyright © 2016 Guilherme Ruiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var images = [UIImageView]()

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var contentWidth: CGFloat = 0.0
        let scrollWidth = scrollView.frame.size.width
        
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX : CGFloat = 0.0
            newX = scrollView.frame.size.width / 2 + scrollWidth * CGFloat(x)
            var newY : CGFloat = 0.0
            newY = scrollView.frame.height / 2
            
            contentWidth += newX
            
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: newX-75, y: newY-75, width: 150, height: 150)
            
        }
        
        scrollView.contentSize = CGSize(width: contentWidth, height: scrollView.frame.size.height)
        
        print("Count: \(images.count)")
    }


}

 
