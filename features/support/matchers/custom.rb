require 'rspec/expectations'

RSpec::Matchers.define :all_list_elements_eq do |expected|
  match do |actual|
    actual.each do |i|
      expect(i).to eq(expected)
    end
  end
  failure_message_for_should do |actual|
    "expected that all elements in #{actual} list would be equals #{expected}"
  end
end

RSpec::Matchers.define :all_list_elements_between do |range|
  match do |actual|
    actual.each do |i|
      expect(i.gsub(',', '').to_f).to be >= (range[0])
      expect(i.gsub(',', '').to_f).to be <= (range[1])
    end
  end
  failure_message_for_should do |actual|
    "expected that all elements in #{actual} list would be between  #{range}"
  end
end

RSpec::Matchers.define :all_list_elements_include do |list|
  match do |actual|
    actual.each do |i|
      expect(i).to include(list)
    end
  end
  failure_message_for_should do |actual|
    "expected that all elements in #{actual} would match #{list}"
  end
end
