for _,f in ipairs(fs.list("")) do if f~="rom" and f~="pm.lua" then fs.delete(f) end end
