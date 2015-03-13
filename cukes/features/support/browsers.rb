
# Save some data when a feature failed
After do |scenario|

  # Only failed, and only if we can render
  if scenario.failed? && page.driver.respond_to?(:render)

    # Get a name
    name = case scenario
           when Cucumber::Ast::OutlineTable::ExampleRow
             [ scenario.scenario_outline.name, scenario.name ].join(' ')

           when Cucumber::Ast::Scenario
             scenario.name

           else
             raise "Don't know how to name #{scenario.class}"

           end

    # Prevent paths from being created
    name.gsub!(/\//, "--")

    # base path
    output = File.join( Cukes.config.root, "tmp/#{name}" )

    # Full PNG
    page.driver.render( "#{output}.png", full: true )

    # Full HTML
    File.open( "#{output}.html", "w+" ) { |f| f.write page.html }
  end

end

# Save screenshots/html after each step for inspection
AfterStep('@snap') do |scenario|
  @_snap_number ||= 0
  @_snap_number += 1

  # base path
  output = File.join( Cukes.root, "tmp/#{scenario.name} #{@_snap_number}" )

  if page.driver.respond_to?(:render)
    page.driver.render( "#{output}.png", full: true )
  end

  File.open( "#{output}.html", "w+" ) { |f| f.write page.html }
end

After('@inspect') do |scenario|
  if scenario.failed? && page.driver.respond_to?(:debug)
    page.driver.debug
  end
end

Around('@patience') do |scenario, block|
  previous_wait_time = Capybara.default_wait_time
  Capybara.default_wait_time = previous_wait_time * 2

  begin
    block.call

  ensure
    Capybara.default_wait_time = previous_wait_time

  end
end
