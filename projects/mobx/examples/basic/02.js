(function() {
  const {observable, observe, computed} = mobx

  const inputValues = observable([])
  const total = computed(() => inputValues.reduce(function(acc, val, idx){
    return acc + val * Math.pow(10, idx)
  }))

  window.inputOnChange = (number) => {
    const text = document.getElementById(`text-${number}`)
    const newValue = parseFloat(text.value)
    inputValues[number - 1] = newValue
  }

  function createInput(number) {
    const main = document.getElementById("main")
    const text = document.createElement("input")
    const p = document.createElement("p")
    const label = document.createElement("span")

    text.setAttribute("onkeyup", `inputOnChange(${number})`)
    text.setAttribute("id", `text-${number}`)
    label.innerHTML = `x${Math.pow(10, number - 1)}`

    inputValues.push(0)

    p.appendChild(text)
    p.appendChild(label)
    main.appendChild(p)
  }

  function createTotal() {
    const main = document.getElementById("main")
    const totalEl = document.createElement("p")
    totalEl.setAttribute("id", "total")
    totalEl.innerHTML = "0"

    main.appendChild(totalEl)
  }

  function createHeader() {
    const main = document.getElementById("main")
    const header = document.createElement("h1")
    header.innerHTML = "Only use integers:"
    main.appendChild(header)
  }

  function bootstrap() {
    createHeader()
    createInput(1)
    createInput(2)
    createInput(3)
    createTotal()

    observe(total, (newVal) => {
      const totalEl = document.getElementById("total")
      totalEl.innerHTML = newVal
    })
  }

  bootstrap()
})()
