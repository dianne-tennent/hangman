require './model'

RSpec.describe Model, "#lives" do
  context "Some context" do
    it "does this cool thing" do
      state = Model.new(9)
      expect(state.lives).to eq 9

    end
  end
end