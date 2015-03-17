class ClientLinksPage < SitePrism::Page

  set_url "/client-links"

  element :add_client_link, '.add-client-link'

  def new_client_link
    add_client_link.click
  end
end