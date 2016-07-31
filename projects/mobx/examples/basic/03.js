(() => {
  const {map} = mobx
  const map1 = map()
  map1.intercept((change) => {
    if (change.name === "double") change.newValue = change.newValue * 2
    return change
  })

  map1.set("simple", 1)
  map1.set("double", 1)

  console.log("simple", map1.get("simple"))
  console.log("double", map1.get("double"))
})()
