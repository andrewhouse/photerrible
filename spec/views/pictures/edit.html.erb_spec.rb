require 'spec_helper'

describe "pictures/edit" do
  before(:each) do
    @picture = assign(:picture, stub_model(Picture,
      :title => "MyString",
      :caption => "MyText"
    ))
  end

  it "renders the edit picture form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", picture_path(@picture), "post" do
      assert_select "input#picture_title[name=?]", "picture[title]"
      assert_select "textarea#picture_caption[name=?]", "picture[caption]"
    end
  end
end
