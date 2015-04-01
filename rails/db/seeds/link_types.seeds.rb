[
  "Normal",
  "Multi-Tenant",
  "Layer 2 Wholesale",
  "IS Internal (Staff Account)"
].each do |linktype|
  LinkType.find_or_create_by(name: linktype)
end