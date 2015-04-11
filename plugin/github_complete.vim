if (exists('g:loaded_github_complete') && g:loaded_github_complete) || &cp
    finish
endif
let g:loaded_github_complete = 1

if !empty(g:github_complete#fetch_issue_api_filetypes) && g:github_complete#enable_api_cache
    augroup plugin-github-complete-fetch-issues
        autocmd!
        for s:ft in g:github_complete#fetch_issue_api_filetypes
            execute 'autocmd FileType' s:ft 'silent! call github_complete#issue#fetch_issues()'
        endfor
        unlet! s:ft
    augroup END
endif

if !empty(g:github_complete#overwrite_omnifunc_filetypes)
    augroup plugin-github-complete-overwrite-omnifunc
        autocmd!
        execute 'autocmd FileType' join(g:github_complete#overwrite_omnifunc_filetypes, ',') 'set omnifunc=github_complete#complete'
    augroup END
endif
