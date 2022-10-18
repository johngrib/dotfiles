"* axring 설정
"https://github.com/tenfyzhong/axring.vim

let g:axring_rings = [
            \ ['&&', '||'],
            \ ['&', '|', '^'],
            \ ['&=', '|=', '^='],
            \ ['>>', '<<'],
            \ ['>>=', '<<='],
            \ ['==', '!='],
            \ ['>', '<', '>=', '<='],
            \ ['++', '--'],
            \ ['true', 'false'],
            \ ['verbose', 'debug', 'info', 'warn', 'error', 'fatal'],
            \ ]

let g:axring_rings_go = [
            \ [':=', '='],
            \ ['byte', 'rune'],
            \ ['complex64', 'complex128'],
            \ ['int', 'int8', 'int16', 'int32', 'int64'],
            \ ['uint', 'uint8', 'uint16', 'uint32', 'uint64'],
            \ ['float32', 'float64'],
            \ ['interface', 'struct'],
            \ ]

let g:axring_rings_vimwiki = [
            \ ['##', '###', '####'],
            \ ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            \ ]

let g:axring_rings_clojure = [
            \ ["{", '#{'],
            \ ]

let g:axring_rings_gitrebase = ['pick', 'reword', 'edit', 'squash', 'fixup']

