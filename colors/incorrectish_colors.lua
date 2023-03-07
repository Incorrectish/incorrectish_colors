for k in pairs(package.loaded) do
    if k:match(".*incorrectish_colors.*") then package.loaded[k] = nil end
end

require('incorrectish_colors').setup()
require('incorrectish_colors').colorscheme()
