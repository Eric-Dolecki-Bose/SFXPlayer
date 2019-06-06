# SFXPlayer
A Swift 5 Class/supporting class that allows for the playback of Do-Ra-Mi etc. Initially for use with Bose AR heading angle.

## Example Use

```
sfxPlayer = SFXPlayer()
        
// Create a player that allows for rapid same note playing via it's init.
// let somePlayer = SFXPlayer(allowRepeatNotePlay: true)
        
// Or after making a player, change it's ability for rapid same note playing.
// sfxPlayer.setAllowsRepeatNotePlay(allow: true)

sfxPlayer.playNote(note: .DO)
```
