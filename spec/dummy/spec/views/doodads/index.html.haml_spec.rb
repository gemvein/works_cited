require 'rails_helper'

RSpec.describe "doodads/index", type: :view do
  before(:each) do
    assign(:doodads, [
      Doodad.create!(
        name: "Name",
        description: "MyText"
      ),
      Doodad.create!(
        name: "Name",
        description: "MyText"
      )
    ])
  end

  it "renders a list of doodads" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
