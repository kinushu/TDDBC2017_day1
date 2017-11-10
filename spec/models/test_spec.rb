require File.dirname(__FILE__) + '/../spec_helper'

describe 'Test' do
  describe 'test1' do
    subject { (1+1) }
    context 'sample' do
      it{ expect(subject).to eq 2 }
    end
  end
end


