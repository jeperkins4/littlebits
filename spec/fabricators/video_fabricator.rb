Fabricator(:video) do
  invention      { Invention.last || Fabricate(:invention) }
  name           "MyString"
  priority       1
end
