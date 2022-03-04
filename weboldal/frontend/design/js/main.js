/*--------------------------------------------------------------
# Selector
--------------------------------------------------------------*/
const select = (el, all = false) => {
  el = el.trim()
  if (all) {
    return [...document.querySelectorAll(el)]
  } else {
    return document.querySelector(el)
  }
}

/*--------------------------------------------------------------
# Listener
--------------------------------------------------------------*/
const on = (type, el, listener, all = false) => {
  let selectEl = select(el, all)
  if (selectEl) {
    if (all) {
      selectEl.forEach(e => e.addEventListener(type, listener))
    } else {
      selectEl.addEventListener(type, listener)
    }
  }
}

/*--------------------------------------------------------------
# Scroll listener
--------------------------------------------------------------*/
const onscroll = (el, listener) => {
  el.addEventListener('scroll', listener)
}

/*--------------------------------------------------------------
# Menu hattér áttetszősége
--------------------------------------------------------------*/
let selectHeader = select('#header')
let selectTopbar = select('#topbar')
if (selectHeader) {
  const headerScrolled = () => {
    if (window.scrollY > 100) {
      selectHeader.classList.add('header-scrolled')
      if (selectTopbar) {
        selectTopbar.classList.add('topbar-scrolled')
      }
    } else {
      selectHeader.classList.remove('header-scrolled')
      if (selectTopbar) {
        selectTopbar.classList.remove('topbar-scrolled')
      }
    }
  }
  window.addEventListener('load', headerScrolled)
  onscroll(document, headerScrolled)
}

/*--------------------------------------------------------------
# Mobil nézet menu
--------------------------------------------------------------*/
on('click', '.mobile-nav-toggle', function(e) {
  select('#navbar').classList.toggle('navbar-mobile')
  this.classList.toggle('bx-menu')
  this.classList.toggle('bx-x')
})

/*--------------------------------------------------------------
# Animáció
--------------------------------------------------------------*/
window.addEventListener('load', () => {
  AOS.init({
    duration: 1000,
    easing: 'ease',
  })
});