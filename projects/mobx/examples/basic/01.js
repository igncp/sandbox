(() => {
  const {observable, action, observe} = mobx

  const appState = observable({
    timer: 0,
  })

  const dispose = observe(appState, "timer", () => {
    console.log(`New appState timer: ${appState.timer}`)
  })

  const intervalId = setInterval(action(() => {
    appState.timer += 1
    if (appState.timer === 5) dispose()
    if (appState.timer === 7) clearInterval(intervalId)
  }), 1000)

})()
