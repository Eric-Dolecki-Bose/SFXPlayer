//
//  SFXPlayer.swift
//  multipleAudio
//
//  Created by Eric Dolecki on 5/24/19.
//  Copyright © 2019 Eric Dolecki. All rights reserved.
//

import UIKit
import AVFoundation

enum Note {
    case DO, RA, MI, FA, SO, LA, TI, DO_END, UNSET
}

// This class uses the Sound Class to do the dirty work.

class SFXPlayer: NSObject {

    // Maintain a reference so that they can play.
    
    var myPlayers = [Sound]()
    var currentNote: Note = .UNSET
    var allowRepeatNotePlay = false
    
    // This init does not overwrite the default allowRepeatNotePlay.
    override init() {
        super.init()
    }
    
    // This init does allow overwrite of the default allowRepeatNotePlay.
    init(allowRepeatNotePlay boo: Bool) {
        super.init()
        allowRepeatNotePlay = boo
    }

    // Allows the flag to be set at any time after creation.
    public func setAllowsRepeatNotePlay(allow boo:Bool) {
        allowRepeatNotePlay = boo
    }
    
    public func playNote(note: Note)
    {
        if !allowRepeatNotePlay {
            if currentNote == note {
                return
            }
            currentNote = note
        }
        
        let result = returnFileNameAndPan(note: note)
        let path = Bundle.main.path(forResource: result.file, ofType: "wav")
        let url = URL(fileURLWithPath: path!)
        
        let mySound = Sound(url: url)
        mySound!.volume = 1
        mySound!.pan = result.pan
        mySound!.play()
        myPlayers.append(mySound!)
        
        // Clean up the references as they complete. Keep memory down.
        
        mySound!.play { completed in
            if self.myPlayers.count != 0 {
                self.myPlayers.remove(at: 0)
            }
        }
    }
    
    private func returnFileNameAndPan(note: Note) -> (file: String, pan: Float)
    {
        // Default values.
        var file = ""
        var pan: Float = 0.0
        
        if note == .DO {
            file = "01-01-Do"
            pan = -1
        } else if note == .RA {
            file = "01-02-Ra"
            pan = -0.75
        } else if note == .MI {
            file = "01-03-Mi"
            pan = -0.50
        } else if note == .FA {
            file = "01-04-Fa"
            pan = -0.25
        } else if note == .SO {
            file = "01-05-So"
            pan = 0.25
        } else if note == .LA {
            file = "01-06-La"
            pan = 0.50
        } else if note == .TI {
            file = "01-07-Ti"
            pan = 0.75
        } else if note == .DO_END {
            file = "01-08-Do"
            pan = 1.0
        }
        return (file, pan)
    }
}
