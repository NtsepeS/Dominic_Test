FactoryGirl.define do
  factory :<%= singular_name %> do
  <% attributes.each do |attr| -%>
  <%= attr.name %> "<%= factory_type(attr.type)-%>"
  <% end -%>
end
end
