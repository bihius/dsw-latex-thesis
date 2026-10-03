-- Renders ```mermaid code blocks to vector PDF via mermaid-cli and embeds them as figures.
--
-- Caption: a paragraph directly after the block is used as the caption when it is
--   *Italic text*   or   : Text
-- (keeps the source previewable in Obsidian, which renders ```mermaid natively).
--
-- Renders are cached in output/mermaid/<sha1>.pdf; unchanged diagrams are not re-rendered.
-- Requires: (cd tools/mermaid && npm install), Chromium/Chrome (path in tools/mermaid/puppeteer.json).

local OUT_DIR = "output/mermaid"
local MMDC = "tools/mermaid/node_modules/.bin/mmdc"
local PUPPETEER_CONFIG = "tools/mermaid/puppeteer.json"
local RENDER_VERSION = "1" -- bump to invalidate cache after changing render options

local function file_exists(path)
  local f = io.open(path, "rb")
  if f then f:close() return true end
  return false
end

local function render(code)
  code = code:gsub("\t", "    ")
  local hash = pandoc.sha1(RENDER_VERSION .. "\n" .. code)
  local pdf = OUT_DIR .. "/" .. hash .. ".pdf"
  if file_exists(pdf) then return pdf end

  os.execute("mkdir -p '" .. OUT_DIR .. "'")
  local src = OUT_DIR .. "/" .. hash .. ".mmd"
  local f = assert(io.open(src, "w"))
  f:write(code)
  f:close()

  local cmd = string.format("'%s' -q -p '%s' -i '%s' -o '%s' --pdfFit -b transparent",
    MMDC, PUPPETEER_CONFIG, src, pdf)
  local ok = os.execute(cmd)
  if not ok or not file_exists(pdf) then
    error("mermaid render failed for diagram " .. hash .. " (source: " .. src .. ")")
  end
  return pdf
end

local function caption_of(block)
  if not block or block.t ~= "Para" then return nil end
  local c = block.content
  if #c == 1 and c[1].t == "Emph" then
    return c[1].content
  end
  if #c >= 3 and c[1].t == "Str" and c[1].text == ":" and c[2].t == "Space" then
    local rest = pandoc.List()
    for i = 3, #c do rest:insert(c[i]) end
    return rest
  end
  return nil
end

function Pandoc(doc)
  local out = pandoc.List()
  local i = 1
  while i <= #doc.blocks do
    local b = doc.blocks[i]
    if b.t == "CodeBlock" and b.classes:includes("mermaid") then
      local path = render(b.text)
      local caption = caption_of(doc.blocks[i + 1])
      if caption then
        local img = pandoc.Image(caption, path)
        out:insert(pandoc.Figure({ pandoc.Plain({ img }) }, { long = { pandoc.Plain(caption) } }))
        i = i + 2
      else
        out:insert(pandoc.Para({ pandoc.Image({}, path) }))
        i = i + 1
      end
    else
      out:insert(b)
      i = i + 1
    end
  end
  doc.blocks = out
  return doc
end
