let g:acp_colorForward = 'Pmenu'
let g:acp_colorReverse = 'Pmenu'
let g:acp_behaviorKeywordLength = 2
let g:acp_behaviorRubyOmniMethodLength = 2
let g:acp_reverseMappingInReverseMenu = 1
" Include things in iskeyword in localcomplete keyword chars so we can match
" things-like-this in sass and such.
let g:localcomplete#AdditionalKeywordChars = '$-'

" let g:acp_refeed_checkpoints = [2]
let g:acp_behavior = {}

" Complete keywords first locally, then all buffers
" Complete everything else first locally, then all buffers, then omni
" Include tags if all else fails
let g:acp_behavior['ruby'] = [
  \  {
  \    'command': "\<C-X>\<C-U>",
  \    'completefunc': 'mycomplete#CompleteCombinerRubyKeywords',
  \    'meets': 'acp#meetsForKeyword',
  \    'repeat': 0
  \  },
  \  {
  \    'command' : "\<C-x>\<C-f>",
  \    'meets'   : 'acp#meetsForFile',
  \    'repeat'  : 1,
  \  },
  \  {
  \    'command': "\<C-X>\<C-U>",
  \    'completefunc': 'mycomplete#CompleteCombinerRuby',
  \    'meets': 'acp#meetsForRubyOmni',
  \    'repeat': 0
  \  },
  \  {
  \    'command': "\<C-X>\<C-]>",
  \    'meets': 'acp#meetsForKeyword',
  \    'repeat': 0
  \  }]
let g:acp_behavior['css'] = [
  \  {
  \    'command' : "\<C-x>\<C-o>",
  \    'meets'   : 'acp#meetsForCssOmni',
  \    'repeat'  : 1,
  \  },
  \  {
  \    'command' : "\<C-x>\<C-f>",
  \    'meets'   : 'acp#meetsForFile',
  \    'repeat'  : 1,
  \  },
  \  {
  \    'command': "\<C-X>\<C-U>",
  \    'completefunc': 'mycomplete#CompleteCombinerCss',
  \    'meets': 'acp#meetsForKeyword',
  \    'repeat': 1
  \  },
  \  {
  \    'command' : "\<C-p>",
  \    'meets'   : 'acp#meetsForKeyword',
  \    'repeat'  : 0,
  \  }]
let g:acp_behavior['sass'] = g:acp_behavior['css']
let g:acp_behavior['scss'] = g:acp_behavior['css']