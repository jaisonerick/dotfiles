
local add_fmt_args = function(args)
  local message = args[1][1]

  local table = {}
  local count = 1
  for _ in string.gmatch(message, "{") do
    -- append an item to "table"
    table[#table + 1] = t", "
    table[#table + 1] = i(count, "arg")
    count = count + 1
  end

  return sn(nil, table)
end

return {
  s("pln", {
    t"println!(\"",            -- println!("
      i(1, "message"),         -- message
      t"\"",                   -- "
      d(2, add_fmt_args, {1}), -- ", arg1, arg2, ...
    t({");", ""}),             -- );\n
    i(0)
  }),
  s("p", {
    t"print!(\"",              -- print!("
      i(1, "message"),         -- message
      t"\"",                   -- "
      d(2, add_fmt_args, {1}), -- ", arg1, arg2, ...
    t({");", ""}),             -- );\n
    i(0)
  })
}
