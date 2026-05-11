local nabla = require("nabla")

local function render_all_latex()
  nabla.enable_virt({ autogen = true })
  print("LaTeX rendering enabled for all equations")
end

render_all_latex()
