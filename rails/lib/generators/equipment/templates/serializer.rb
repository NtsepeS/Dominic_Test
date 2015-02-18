class <%= class_name %>Serializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at, <% attributes.each do |attr| -%>:<%= attr.name %><%= ", " unless attr == attributes.last -%><% end -%>
end
