Feature: Basic usage of .display_meta_tags
  

    Scenario: A page that simply uses its layouts .display_meta_tags 
      Given the Server is running at "test-app"
      When I go to "/hello/world.html"
      Then I should see '<title>Hello world!</title>'
      Then I should see '<meta name="description" content="This is the descriptive field" />'

    Scenario: A page that .title has been called      
      Given the Server is running at "test-app"
      When I go to "/hello/title.html"
      Then I should see '<title>Hello New Title</title>'
    Scenario: A page that .title has been called and rendered     
      Given the Server is running at "test-app"
      When I go to "/hello/title.html"
      Then I should see '<title>Hello New Title</title>'
      Then I should see '<blink>Hello New Title</blink>'