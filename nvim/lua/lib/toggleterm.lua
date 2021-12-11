require("toggleterm").setup {
   size = function(term)
       if term.direction == "horizontal" then
         return 20
       elseif term.direction == "vertical" then
         return vim.o.columns * 0.4
       end
   end,
   open_mapping = [[<c-t>]],
   shade_terminals = true,
   shading_factor = 1,
}

