//
//  PlaySongViewController.swift
//  SwappingScreensSample
//
//  Created by Guilherme Ruiz on 15/12/16.
//  Copyright © 2016 Guilherme Ruiz. All rights reserved.
//

import UIKit

class PlaySongViewController: UIViewController {

    @IBOutlet weak var songTitleLabel: UILabel!
    
    private var _selectedSong: String!
    
    var selectedSong: String {
        get {
            return _selectedSong
        } set {
            _selectedSong = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songTitleLabel.text = _selectedSong
    }


}
