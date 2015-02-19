FactoryGirl.define do
  factory :<%= singular_name %> do
    <%- attributes.each do |attr| -%>
      <%- unless attr.type == :references -%>
    <%= attr.name %> "<%= factory_type(attr.type)-%>"
      <%- end -%>
    <%- end -%>
  end
end
