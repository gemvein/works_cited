require 'rails_helper'

RSpec.describe "doodads/edit", type: :view do
  before(:each) do
    @doodad = assign(:doodad, Doodad.create!(
      name: "MyString",
      description: "MyText"
    ))
  end

  it "renders the edit doodad form" do
    render

    assert_select "form[action=?][method=?]", doodad_path(@doodad), "post" do

      assert_select "input[name=?]", "doodad[name]"

      assert_select "textarea[name=?]", "doodad[description]"
    end
  end
end
