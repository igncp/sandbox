# Internals

```js
// Setup the global audio controller.
var Howler = new HowlerGlobal();

(...)

window.HowlerGlobal = HowlerGlobal;
window.Howler = Howler;
window.Howl = Howl;
window.Sound = Sound;
```

## HowlerGlobal.prototype
- init
```
 Initialize the global Howler object.
```
- volume
```
Get/set the global volume for all sounds.
```
- mute
```
Handle muting and unmuting globally.
```
- unload
```
Unload and destroy all currently loaded Howl objects.
```
- codecs
```
Check for codec support of specific extension.
```
- _setup
```
Setup various state values for global tracking.
```
- _setupCodecs
```
Check for browser support for various codecs and cache the results.
```
- _enableMobileAudio
```
Mobile browsers will only allow audio to be played after a user interaction. Attempt to automatically unlock audio on the first user interaction. Concept from: http
```
- _autoSuspend
```
Automatically suspend the Web Audio AudioContext after no sound has played for 30 seconds. This saves processing/energy and fixes various browser-specific bugs with audio getting stuck.
```
- _autoResume
```
Automatically resume the Web Audio AudioContext when a new sound is played.
```

## Howl.prototype
- init
```
 Initialize a new Howl group object.
```
- load
```
 Load the audio file.
```
- play
```
 Play a sound or resume previous playback.
```
- pause
```
 Pause playback and save current position.
```
- stop
```
 Stop playback and reset to start.
```
- mute
```
 Mute/unmute a single sound or all sounds in this Howl group.
```
- volume
```
 Get/set the volume of this sound or of the Howl group. This method can optionally take 0, 1 or 2 arguments.
   volume() -> Returns the group's volume value.
   volume(id) -> Returns the sound id's current volume.
   volume(vol) -> Sets the volume of all sounds in this Howl group.
   volume(vol, id) -> Sets the volume of passed sound id.
```
- fade
```
 Fade a currently playing sound between two volumes (if no id is passsed, all sounds will fade).
```
- _stopFade
```
 Internal method that stops the currently playing fade when
 a new fade starts, volume is changed or the sound is stopped.
```
- loop
```
 Get/set the loop parameter on a sound. This method can optionally take 0, 1 or 2 arguments.
   loop() -> Returns the group's loop value.
   loop(id) -> Returns the sound id's loop value.
   loop(loop) -> Sets the loop value for all sounds in this Howl group.
   loop(loop, id) -> Sets the loop value of passed sound id.
```
- rate
```
  Get/set the playback rate of a sound. This method can optionally take 0, 1 or 2 arguments.
   rate() -> Returns the first sound node's current playback rate.
   rate(id) -> Returns the sound id's current playback rate.
   rate(rate) -> Sets the playback rate of all sounds in this Howl group.
   rate(rate, id) -> Sets the playback rate of passed sound id.
```
- seek
```
 Get/set the seek position of a sound. This method can optionally take 0, 1 or 2 arguments.
   seek() -> Returns the first sound node's current seek position.
   seek(id) -> Returns the sound id's current seek position.
   seek(seek) -> Sets the seek position of the first sound node.
   seek(seek, id) -> Sets the seek position of passed sound id.
```
- playing
```
 Check if a specific sound is currently playing or not (if id is provided), or check if at least one of the sounds in the group is playing or not.
```
- duration
```
 Get the duration of this sound. Passing a sound id will return the sprite duration.
```
- state
```
 Returns the current loaded state of this Howl.
```
- unload
```
 Unload and destroy the current Howl object.
 This will immediately stop all sound instances attached to this group.
```
- on
```
 Listen to a custom event.
```
- off
```
 Remove a custom event. Call without parameters to remove all events.
```
- once
```
 Listen to a custom event and remove it once fired.
```
- _emit
```
 Emit all events of a specific type and pass the sound id.
```
- _loadQueue
```
 Queue of actions initiated before the sound has loaded.
 These will be called in sequence, with the next only firing
 after the previous has finished executing (even if async like play).
```
- _ended
```
 Fired when playback ends at the end of the duration.
```
- _clearTimer
```
 Clear the end timer for a sound playback.
```
- _soundById
```
 Return the sound identified by this ID, or return null.
```
- _inactiveSound
```
 Return an inactive sound from the pool or create a new one.
```
- _drain
```
 Drain excess inactive sounds from the pool.
```
- _getSoundIds
```
 Get all ID's from the sounds pool.
```
- _refreshBuffer
```
 Load the sound back into the buffer source.
```
- _cleanBuffer
```
Prevent memory leaks by cleaning up the buffer source after playback.
```
## Sound.prototype
- init
```
 Initialize a new Sound object.
```
- create
```
 Create and setup a new sound object, whether HTML5 Audio or Web Audio.
```
- reset
```
 Reset the parameters of this sound to the original state (for recycle).
```
- _errorListener
```
 HTML5 Audio error listener callback.
```
- _loadListener
```
 HTML5 Audio canplaythrough listener callback.
```

## Helper variables
- cache
- loadBuffer
- safeXhrSend
- decodeAudioData
- loadSound
- setupAudioContext

## Plugin overrides
- Howl.prototype.init
- Sound.prototype.init
- Sound.prototype.reset

## Plugin additional methods
- Howl.prototype.orientation
- Howl.prototype.pannerAttr
- Howl.prototype.pos
- Howl.prototype.stereo
- HowlerGlobal.prototype._orientation
- HowlerGlobal.prototype._pos
- HowlerGlobal.prototype.orientation
- HowlerGlobal.prototype.pos
- HowlerGlobal.prototype.stereo
