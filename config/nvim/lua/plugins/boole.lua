require('boole').setup({
    mappings = {
      increment = '<C-s>',
      decrement = '<C-x>'
    },
    -- User defined loops
    additions = {
      {'first', 'second', 'third', 'fourth', 'fifth'},
      {'First', 'Second', 'Third', 'Fourth', 'Fifth'},
    },
})
