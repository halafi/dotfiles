require("toggleterm").setup {
   size = function(term)
       if term.direction == "horizontal" then
         return 20
       elseif term.direction == "vertical" then
         return vim.o.columns * 0.4
       end
   end,
   open_mapping = [[<c-m>]],
   shade_terminals = true,
   shading_factor = 1,
   start_in_insert = true,
   insert_mappings = true,
   hide_numbers = true,
}


vim.cmd [[
   function! ToggleTermStrategy(cmd) abort
      call luaeval("require('toggleterm').exec(_A[1], _A[2])", [a:cmd, 0])
   endfunction

   let g:test#custom_strategies = {'toggleterm': function('ToggleTermStrategy')}
]]

vim.g['test#strategy'] = 'toggleterm'

