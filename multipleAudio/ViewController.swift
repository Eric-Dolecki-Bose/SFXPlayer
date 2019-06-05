//
//  ViewController.swift
//  multipleAudio
//
//  Created by Eric Dolecki on 5/24/19.
//  Copyright © 2019 Eric Dolecki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var sfxPlayer: SFXPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sfxPlayer = SFXPlayer()
        
        // Create a player that allows for rapid same note playing via it's init.
        // let somePlayer = SFXPlayer(allowRepeatNotePlay: true)
        
        // Or after making a player, change it's ability for rapid same note playing.
        // sfxPlayer.setAllowsRepeatNotePlay(allow: true)
    }
    
    // Each button uses this method. Ownership is determined by its tag value
    // (entered in the storyboard for each button).
    @IBAction func noteTapped(_ sender: UIButton)
    {
        let indx = sender.tag
        if indx == 0 {
            sfxPlayer.playNote(note: .DO)
        } else if indx == 1 {
            sfxPlayer.playNote(note: .RA)
        } else if indx == 2 {
            sfxPlayer.playNote(note: .MI)
        } else if indx == 3 {
            sfxPlayer.playNote(note: .FA)
        } else if indx == 4 {
            sfxPlayer.playNote(note: .SO)
        } else if indx == 5 {
            sfxPlayer.playNote(note: .LA)
        } else if indx == 6 {
            sfxPlayer.playNote(note: .TI)
        } else if indx == 7 {
            sfxPlayer.playNote(note: .DO_END)
        }
    }
}

