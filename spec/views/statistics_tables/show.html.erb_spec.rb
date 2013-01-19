require 'spec_helper'

describe "statistics_tables/show" do
  before(:each) do
    @statistics_table = assign(:statistics_table, stub_model(StatisticsTable))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
