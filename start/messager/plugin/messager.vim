"command! StartServer call system('perl ' . fnamemodify(expand('<sfile>'), ':p:h') . '/../../../../pack/messager/start/messager/perl/server.pl')
let s:plugindir = expand('<sfile>:p:h:h')
"command! -nargs=1 SendMessage call setline('.', split(system('perl ' . s:plugindir . '/perl/client.pl ' . <q-args>), '\n')[0])
"command! -nargs=1 SendMessage let l:output = split(system('perl ' . s:plugindir . '/perl/client.pl ' . <q-args>), '\n') | call setline('.', getline('.') . l:output[0]) | normal! $
command! -nargs=1 SendMessage call setline('.', getline('.') . split(system('perl ' . s:plugindir . '/perl/client.pl ' . <q-args>), '\n')[0]) | normal! $


