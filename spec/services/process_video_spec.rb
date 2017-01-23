require 'spec_helper'

describe ProcessVideo do
  let(:video) { Fabricate(:video) }

  context 'run' do
    after(:each) do
      RemoveVideo.new(video).run
    end

    it "should process a video" do
      if video.try(:media).try(:url).nil?
        video.media = File.open(File.join('spec','artifacts','videoplayback.mp4'))
        video.save
      end
      # explicitly call
      ProcessVideo.new(video).run
      expect(video.panda_video).to_not be_nil
    end
  end
end
