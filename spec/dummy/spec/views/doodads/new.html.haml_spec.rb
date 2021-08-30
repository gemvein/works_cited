require 'rails_helper'

RSpec.describe "doodads/new", type: :view do
  before(:each) do
    assign(:doodad, Doodad.new(
      name: "MyString",
      description: "MyText"
    ))
  end

  it "renders new doodad form" do
    render

    assert_select "form[action=?][method=?]", doodads_path, "post" do

      assert_select "input[name=?]", "doodad[name]"

      assert_select "textarea[name=?]", "doodad[description]"
    end
  end
end
