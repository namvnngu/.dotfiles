let g:javascript_plugin_flow = 1
autocmd BufEnter *.{ts,tsx} :set syntax=typescript
autocmd BufLeave *.{ts,tsx} :set syntax=typescript
autocmd BufEnter *.{ejs,cshtml,svelte} :set syntax=html
autocmd BufLeave *.{ejs,cshtml,svelte} :set syntax=html
autocmd BufLeave *.{scss,sass} :set syntax=css
