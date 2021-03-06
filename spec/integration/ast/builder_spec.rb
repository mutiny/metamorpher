require "metamorpher"
require "metamorpher/terms/term_set"

describe Metamorpher do
  subject { Metamorpher.builder }

  before { Metamorpher.configure(builder: :ast)  }
  after  { Metamorpher.configure(builder: :ruby) }

  it_behaves_like "a literal builder"
  it_behaves_like "a variable builder"
  it_behaves_like "a greedy variable builder"
  it_behaves_like "a derivation builder"
  it_behaves_like "a term set builder"
end
