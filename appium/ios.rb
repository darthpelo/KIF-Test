require 'rubygems'
require 'appium_lib'

APP_PATH = '/Users/alessioroberto/Library/Developer/Xcode/DerivedData/KIFTest-eroiaqxtytzxauebbnncjvhlsegl/Build/Products/Debug-iphonesimulator/KIFTest.app'

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

    # Recorded code
    # find_element(:xpath, "//UIAApplication[1]/UIAWindow[1]/UIAButton[1]").click
    # find_element(:xpath, "//UIAApplication[1]/UIAWindow[1]/UIATextField[1]/UIATextField[1]").send_keys "a"
    # find_element(:xpath, "//UIAApplication[1]/UIAWindow[1]/UIATextField[2]/UIATextField[1]").send_keys "b"
    # find_element(:xpath, "//UIAApplication[1]/UIAWindow[1]/UIAButton[1]").click
    # alert_accept

    # Manual code
    # # First View
    # title = find_element(:xpath, "//UIAApplication[1]/UIAWindow[1]/UIANavigationBar[1]/UIAStaticText[1]")
    # raise Exception unless title.label == "First View"

    next_button =
    find_element(:xpath, "//UIAApplication[1]/UIAWindow[1]/UIAButton[1]")
    next_button.click
    puts 'Tapped Next button'

    # # Second View
    # title = find_element(:xpath, "//UIAApplication[1]/UIAWindow[1]/UIANavigationBar[1]/UIAStaticText[1]")
    # raise Exception unless title.label == "Second View"

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

    title = find_element(:xpath, "//UIAApplication[1]/UIAWindow[1]/UIANavigationBar[1]/UIAStaticText[1]")

    raise Exception unless title.label == "First View"

    modal_button = find_element(:xpath, "//UIAApplication[1]/UIAWindow[1]/UIAButton[2]")
    modal_button.click
    puts 'Tapped Modal button'

    driver_quit
    puts 'Tests Finished'

  end
end
