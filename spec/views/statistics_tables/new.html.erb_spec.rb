require 'spec_helper'

describe "statistics_tables/new" do
  before(:each) do
    assign(:statistics_table, stub_model(StatisticsTable).as_new_record)
  end

  it "renders new statistics_table form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => statistics_tables_path, :method => "post" do
    end
  end
end
