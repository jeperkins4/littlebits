require 'spec_helper'

describe ProcessVideo do
  let(:invention) { Fabricate(:invention) }

  context 'run' do
    it "should process a video" do
      invention.video = File.open(File.join('spec','artifacts','videoplayback.mp4'))
      invention.save
      ProcessVideo.new(invention).run
      expect(invention.panda_video).to_not be_nil
    end
  end
end
