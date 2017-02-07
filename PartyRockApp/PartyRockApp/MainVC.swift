//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Guilherme Ruiz on 20/12/16.
//  Copyright © 2016 Guilherme Ruiz. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageTest = "http://portal01.cdn.superplayer.fm/7/9/792CFBE4A54C101B8D8E6488F57B11A9.png"
        
        let urlTest = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/KQ6zr6kCPj8\" frameborder=\"0\" allowfullscreen></iframe>"
        
        let p1 = PartyRock(imageURL: imageTest, videoURL: urlTest, videoTitle: "Party Rock")
        let p2 = PartyRock(imageURL: imageTest, videoURL: urlTest, videoTitle: "Lights Out")
        let p3 = PartyRock(imageURL: imageTest, videoURL: urlTest, videoTitle: "Let's Get Ridiculous")
        let p4 = PartyRock(imageURL: imageTest, videoURL: urlTest, videoTitle: "Where The Sun Goes")
        let p5 = PartyRock(imageURL: imageTest, videoURL: urlTest, videoTitle: "Juicy Wiggle")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyRock", for: indexPath) as? PartyCell {
            let partyRock =  partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "VideoSegue", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }

}

