local modes = require "modes"

-- Creates new bindings from old ones.
modes.remap_binds("normal", -- This is the mode in which the bindings are active.
  {
  --  new     old     removes the old binding (defaults to false)
     {"u",    "H",    true},
     {"m",    "L",    true},
     {"O",    "t",    true},
  })


local select = require "select"

select.label_maker = function (s)
    local chars = s.charset("asdfqwerzxcv")
    return s.trim(s.sort(s.reverse(chars)))
end


local modes = require("modes")
local link_fmt = "l '%s'"
modes.add_binds("ex-follow", {
  { "m", "Hint all links and open externally",
      function (w)
          w:set_mode("follow", {
              prompt = "lunch external script", selector = "uri", evaluator = "uri",
              func = function (uri)
                  assert(type(uri) == "string")
                  luakit.spawn(string.format(link_fmt, uri))
                  w:notify("Loading...")
              end
          })
      end },
      })
