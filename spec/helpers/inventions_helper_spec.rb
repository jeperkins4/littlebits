require 'rails_helper'

describe InventionsHelper do
  let(:invention) { Fabricate(:invention, bits: ['battery'], materials: ['paper']) }
  let!(:photo) { Fabricate(:photo, invention: invention) }

  context 'poster' do
    it "should render a photo poster" do
      expect(helper.poster(invention)).to include('<img')
    end
  end

  context 'bits' do
    it "should render list o bits" do
      expect(helper.bits(invention)).to include('battery')
    end
  end

  context 'materials' do
    it "should render a list of materials" do
      expect(helper.materials(invention)).to include('paper')
    end
  end
end
