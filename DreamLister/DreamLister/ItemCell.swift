//
//  ItemCell.swift
//  DreamLister
//
//  Created by Guilherme Ruiz on 27/01/17.
//  Copyright © 2017 Guilherme Ruiz. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var details: UILabel!
    
    
    func configureCell(item: Item){
        title.text = item.title
        type.text = item.toItemType?.type
        price.text = "U$ \(item.price)"
        details.text = item.details
        thumb.image = item.toImage?.image as? UIImage
    }
}
