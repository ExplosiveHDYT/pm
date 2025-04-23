print("WARNING, DELETING ALL FILES, CONTINUE? (y/n)")
if read() == "y" then
  for _,f in ipairs(fs.list("")) do if f~="rom" and f~="pm.lua" then fs.delete(f) end end
else
  print("Operation cancelled")
