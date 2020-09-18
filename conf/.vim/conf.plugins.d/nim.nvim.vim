au User asyncomplete_setup call asyncomplete#register_source({
  \ 'name': 'nim',
  \ 'whitelist': ['nim'],
  \ 'completor': {opt, ctx -> nim#suggest#sug#GetAllCandidates({start, candidates -> asyncomplete#complete(opt['name'], ctx, start, candidates)})}
  \ })
