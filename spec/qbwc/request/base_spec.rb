require 'spec_helper'

class GenericBase < Qbwc::Request::Base

end

describe GenericBase do
  
  describe '#initialize' do

    it 'should deal with nil values' do
      expect {
        GenericBase.new(nil)  
      }.to_not raise_error
    end

  end

end
