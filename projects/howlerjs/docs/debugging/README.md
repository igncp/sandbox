# Debugging

## Desktop, recent Chrome, new Howl({src: ["foo/bar.mp3"]})

- Howl: Checks that the `src` property is present (otherwise it throws)
- Howl.prototype.init: Checks that the global `Howler.ctx` is not defined to create it (otherwise don't create it)
- setupAudioContext: as `AudioContext` is available, initialize it into `Howler.ctx` without arguments
- setupAudioContext: initializes a test `Audio` to confirm if it doesn't have the `.muted` property set to false
- setupAudioContext: confirms that it is not using it from an IOS mobile app
- setupAudioContext: confirms that it is using WebAudio to cache the master `GainNode`
- HowlerGlobal.prototype._setup: sets the Howler state as "running"
- HowlerGlobal.prototype._autoSuspend: creates a 30 seconds timeout to suspend the context if no sound is played to save resources
- HowlerGloba.prototype._setupCodecs: sets a map of codecs that are available and attaches it to the `Howler`
-

