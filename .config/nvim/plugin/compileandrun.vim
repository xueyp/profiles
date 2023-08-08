nnoremap <leader>rr :call <SID>compile_and_run()<CR><cmd>copen<cr>

function! s:compile_and_run()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
       exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
       exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
       exec "AsyncRun! time bash %"
    elseif &filetype == 'python'
       exec "AsyncRun! time /home/x/venvs/DataAnalytics/bin/python3 %"
    elseif &filetype == 'R'
       exec "AsyncRun! time Rscript %"
    elseif &filetype == 'go'
       exec "AsyncRun! time go run %"
    endif
endfunction
let g:asyncrun_open = 15
