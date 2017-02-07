//
//  RoundedImageView.swift
//  MVCSample
//
//  Created by Guilherme Ruiz on 22/12/16.
//  Copyright © 2016 Guilherme Ruiz. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {

    override func awakeFromNib() {
        self.layer.cornerRadius = 100
        self.clipsToBounds = true
        self.contentMode = UIViewContentMode.scaleAspectFill
    }
}
