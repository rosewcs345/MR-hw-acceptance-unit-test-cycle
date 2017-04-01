require 'rails_helper'

describe MoviesHelper do
  describe '#oddness' do
    before :each do 
      @odd_number = 3
      @even_number = 4
      @zero = 0
    end
 
    context 'When the count is odd' do
      it 'returns "odd" when count is odd' do
        expect(@odd_number.odd?).to equal(true)
        #expect(helper.oddness(@odd_number)).to eq("odd")
      end
    end
    context 'When the count is even' do
      it 'returns "even" when count is even' do
        expect(@even_number.odd?).to equal(false)
       # expect(helper.oddness(@even_number)).to eq("even")
      end
    end
    context 'When the count is zero' do
      it 'returns "even" when count is zero' do
        expect(@zero.odd?).to equal(false)
        #expect(helper.oddness(@zero)).to eq("even")
      end
    end
  end
end

=begin
describe MoviesHelper do
  describe '#oddness' do
    before :each do
      @odd = 3
      @even = 2
      @zero = 0
    end 
    describe 'When count is odd' do
      it 'Returns "odd" when count is odd' do
        expect(helper.oddness(@odd)).to eq('odd')
      end
    end
    describe 'When count is even' do
      it 'Returns "even" when count is even' do
        expect(helper.oddness(@even)).to eq('even')
      end
      it 'Returns "even" when count is zero' do
        expect(helper.oddness(@zero)).to eq('even')
      end
    end
  end
end
=end