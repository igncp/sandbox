# Gotchas

 - The Web Audio AudioContext is suspended after no sound has played for 30 seconds. "This saves processing/energy and fixes various browser-specific bugs with audio getting stuck."
 - Mobile browsers will only allow audio to be played after a user interaction. It attempts to automatically unlock audio on the first user interaction. [Resource](http://paulbakaus.com/tutorials/html5/web-audio-on-ios/)
 - The `error.code === 4` refers to `MEDIA_ERR_SRC_NOT_SUPPORTED`.
 - In plugins, it extends methods with this pattern:
```js
  Howl.prototype.init = (function(_super) {
    return function(o) {
      var self = this;

      // (...)

      return _super.call(this, o);
    };
  })(Howl.prototype.init);
```
