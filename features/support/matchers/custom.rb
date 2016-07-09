require 'rspec/expectations'

RSpec::Matchers.define :all_list_elements_eq do |expected|
  match do |actual|
    actual.each do |i|
      expect(i).to eq(expected)
    end
  end  
end
