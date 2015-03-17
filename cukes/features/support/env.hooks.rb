After do |scenario|
  if scenario.failed?
    save_page
  end
end

Before do |scenario|
  @app ||= Application.new
end
