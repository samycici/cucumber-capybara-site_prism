# encoding: utf-8
# !/usr/bin/env ruby
class Helper
  def mouse_over(page, element_selector)
    element = page.driver.browser.find_element(:css, element_selector)
    page.driver.browser.mouse.move_to element
  end
end
