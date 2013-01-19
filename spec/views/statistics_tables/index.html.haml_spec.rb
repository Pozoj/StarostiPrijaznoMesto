require 'spec_helper'

describe "statistics_tables/index" do
  before(:each) do
    assign(:statistics_tables, [
      stub_model(StatisticsTable),
      stub_model(StatisticsTable)
    ])
  end

  it "renders a list of statistics_tables" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
