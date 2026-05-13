-- Define a global counter for level 2 headers
subheading_count = 0

function Header(el)
  if el.level == 2 then
    -- Increment the counter
    subheading_count = subheading_count + 1

    -- Modify header text to include an independent number
    local new_text = pandoc.Str(tostring(subheading_count) .. ". " .. pandoc.utils.stringify(el.content))
    el.content = { new_text }
  end
  return el
end


function Meta(meta)
  local docversion = pandoc.utils.stringify(meta["doc-version"] or "")

  -- Titelseite (alle Formate)
  meta.subtitle = pandoc.MetaInlines(pandoc.read(docversion).blocks[1].content)

  -- PDF-Fußzeile
local latex = string.format([[
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\lfoot{\tiny %s}
\cfoot{\thepage}
\fancypagestyle{plain}{
  \fancyhf{}
  \lfoot{\tiny %s}
  \cfoot{\thepage}
}
]], docversion, docversion)

  meta["header-includes"] = meta["header-includes"] or pandoc.MetaList({})
  table.insert(meta["header-includes"], pandoc.MetaBlocks({
    pandoc.RawBlock("latex", latex)
  }))

  return meta
end