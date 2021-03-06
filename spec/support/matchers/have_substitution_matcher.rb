require "rspec/expectations"

RSpec::Matchers.define :have_substitution do |expected|
  match do |actual|
    actual.substitution == expected
  end

  failure_message do |actual|
    "expected the substitution #{actual.substitution}, but got #{expected}"
  end

  failure_message_when_negated do |actual|
    "expected to not receive the substitution #{actual.substitution}"
  end
end
