Fabricator(:photo) do
  name        "MyString"
  description "MyString"
  priority    1
  media       { File.open(File.join('spec', 'artifacts', 'fu.jpg')) }
end
