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
