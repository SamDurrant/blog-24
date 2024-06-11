// Menu manipulation

// add toggle listeners to listen for clicks
document.addEventListener('turbo:load', () => {
  let hamburger = document.querySelector('#hamburger')
  hamburger.addEventListener('click', (event) => {
    event.preventDefault()
    let menu = document.querySelector('#navbar-menu')
    menu.classList.toggle('collapse')
  })

  let account = document.querySelector('#menu-button')
  account.addEventListener('click', (event) => {
    event.preventDefault()
    let menu = document.querySelector('#dropdown-menu')
    menu.classList.toggle('active')
  })
})
