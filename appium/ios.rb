require 'rubygems'
require 'appium_lib'

APP_PATH = '../KIFTest/build/KIFTest.zip'

desired_caps = {
  caps: {
    platformName: 'iOS',
    versionNumber: '9.3',
    deviceName: 'iPhone 5s',
    app: APP_PATH
  },
  appium_lib: {
    sauce_username:   nil, # don't run on Sauce
    sauce_access_key: nil
  }
}

Appium::Driver.new(desired_caps).start_driver

module Test
  module IOS
    Appium.promote_singleton_appium_methods Test
    navBarTitle = "//UIAApplication[1]/UIAWindow[1]/UIANavigationBar[1]/UIAStaticText[1]"

    puts 'Test starts'

    # First View
    title = find_element(:xpath, navBarTitle)
    raise Exception unless title.label == "First View"

    next_button =
    find_element(:xpath, "//UIAApplication[1]/UIAWindow[1]/UIAButton[1]")
    next_button.click
    puts 'Tapped Next button'

    # # Second View
    title = find_element(:xpath,navBarTitle)
    raise Exception unless title.label == "Second View"

    # Find every textfield.
    elements = textfields
    values       = [rand(10), rand(10)]
    elements.each_with_index do |element, index|
      element.send_keys(values[index])
    end

    done_button =
    find_element(:xpath, "//UIAApplication[1]/UIAWindow[1]/UIAButton[1]")
    done_button.click
    puts 'Tapped Done button'

    title = find_element(:xpath, navBarTitle)
    raise Exception unless title.label == "First View"

    modal_button = find_element(:xpath,
    "//UIAApplication[1]/UIAWindow[1]/UIAButton[2]")
    modal_button.click
    puts 'Tapped Modal button'

    title = find_element(:xpath,
    "//UIAApplication[1]/UIAWindow[1]/UIAStaticText[1]")
    raise Exception unless title.label == "List"

    # close_button = find_element(:xpath,
    # "/UIAApplication[1]/UIAWindow[1]/UIAButton[1]")
    # close_button.click
    find_element(:xpath, "//UIAApplication[1]/UIAWindow[1]/UIAButton[1]").click
    puts 'Tapped Close button'

    driver_quit
    puts 'Tests Finished'

  end
end
