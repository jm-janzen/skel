"""
""" Javascript configuration
"""




"let b:ale_linters = {'javascript': ['eslint']}

let @l = "o/*XXX*/console.log('OINK',);hh"

""" ReactJS configuration (TODO split off)

"set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab


" Wrap visual selection in 'JSON.stringify(<SELECTION>)'
let @J = "sjs<80>kb<80>kbJSON.stringify()^[Pll"
