class ClientLinkPage < SitePrism::Page

  set_url "/client-links{/client_link_id}"

  element :client_select, "#client-select"
  element :branch_input, "#branch-input"
  element :save_button, ".qa-save"

  def site_information(data)
    client_select.select(data['Client']) if data.has_key? 'Client'
    branch_input.set(data['Branch']) if data.has_key? 'Branch'
  end

  def save
    save_button.trigger('click')
  end
end