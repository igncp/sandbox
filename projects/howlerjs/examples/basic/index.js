(function() {
  console.log('serialized Howler', JSON.stringify(Howler, null, 4))
  console.log('Howler', Howler)

  console.log('new Howl({})', new Howl({}))
  console.log('Object.keys((new Howl({})).__proto__)', Object.keys((new Howl({})).__proto__))
})()
