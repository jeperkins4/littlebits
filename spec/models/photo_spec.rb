require 'spec_helper'

describe Photo do
  let(:photo) { Fabricate(:photo) }

  context 'delegation' do
    it "should delegate association" do
      photo.invention_name.should be 
    end
  end
end
