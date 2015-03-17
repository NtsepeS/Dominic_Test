class Application
  def initialize
    @pages = {}
  end

  def isid
    @pages[:isid] ||= ISIDPage.new
  end

  def login
    @pages[:login] ||= LoginPage.new
  end

  def home
    @pages[:home] ||= HomePage.new
  end

  def client_links
    @pages[:client_links] ||= ClientLinksPage.new
  end

  def client_link
    @pages[:client_link] ||= ClientLinkPage.new
  end

end

