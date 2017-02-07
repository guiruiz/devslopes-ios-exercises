//
//  MusicListViewController.swift
//  SwappingScreensSample
//
//  Created by Guilherme Ruiz on 15/12/16.
//  Copyright © 2016 Guilherme Ruiz. All rights reserved.
//

import UIKit

class MusicListViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    
    @IBAction func load3rdScreenPressed(_ sender: Any) {
        let songTitle = "The Wall"
        performSegue(withIdentifier: "PlaySongSegue", sender: songTitle)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PlaySongViewController {
            if let song = sender as? String {
                destination.selectedSong = song
            }
        }
    }
    
}
