require 'spec_helper'

describe Invention do
  let(:invention) { Fabricate(:invention) }
  let!(:invention_2) { Fabricate(:invention, materials: %w{legos paper rubberband}) }

  context 'delegation' do
    it "should return a unique list of materials" do
      invention.materials = %w{pencils paper tape}
      invention.save
      expect(Invention.materials.flatten).to_not be_empty
      expect(Invention.materials.flatten).to include('paper')
    end
  end
end
