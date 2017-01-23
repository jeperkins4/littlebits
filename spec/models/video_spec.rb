require 'spec_helper'

describe Video do
  let(:video) { Fabricate(:video) }

  after(:each) do
    RemoveVideo.new(video).run
  end

  context 'delegation' do
    it "should delegate association" do
      video.invention_title.should be
    end
  end
end
