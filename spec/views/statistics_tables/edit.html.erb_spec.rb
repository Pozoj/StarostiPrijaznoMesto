require 'spec_helper'

describe "statistics_tables/edit" do
  before(:each) do
    @statistics_table = assign(:statistics_table, stub_model(StatisticsTable))
  end

  it "renders the edit statistics_table form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => statistics_tables_path(@statistics_table), :method => "post" do
    end
  end
end
