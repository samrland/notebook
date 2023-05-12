-- instead of wasting 5 minutes doing something manually, how about wasting 5 hours automating it?
-- actually though this only took 5 minutes to make and will probably save me a lot of time in the future

-- this doesn't work on linux, need to look into that

-- date in YYYY-MM-DD
io.write("date: ")
local date = io.read("*l")
-- contents in html
print("entities list: &ndash; &mdash; &ldquo; &rdquo;")
io.write("contents: ")
local contents = io.read("*l")

local datepath = date:gsub("-", "/")
local path = "a/" .. datepath .. ".htm" -- date = 2023-04-11, should write to a/2023/04/11.htm

-- write link to index
local linksrc = [[<a href="]] .. path .. [[">]] .. date .. [[</a>]]
--[[
F = io.open("index.html", "w+")
local indexdoc = F:read("*a")
indexdoc = indexdoc:gsub("<!-- newest top -->", "<!-- newest top -->\n" .. linksrc)
F:write(indexdoc)
F:close()
]]
print(linksrc)

local html = [[
<!DOCTYPE html>
<html lang="en">

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width" />
<link href="../../a.css" rel="stylesheet" />

<title>]] .. date .. [[</title>

<body>
  <main>
	  <div class="container">
	  	]] .. contents .. [[
	  </div>

	  <div class="date">
		  <p>]] .. date .. [[ samr</p>
	  </div>
  </main>
</body>

</html>
]]

F = io.open(path, "w")
F:write(html)
F:close()
