require 'rails_helper'

RSpec.describe ExcelExporter do
  subject { ExcelExporter.new(scope) }

  let(:scope) { ClientLink.all }
  let!(:client_link) { create(:client_link) }

  it "should generate a name from the scope" do
    expect( subject.worksheet_name ).to eq("Client Links")
  end

  it "should have all the attribute names as headers" do
    expect( subject.worksheet_headers ).to include("Name")
  end

  it "should have all the attribute values as rows" do
    expect(
     subject.worksheet_data.first
    ).to include( client_link.name )
  end

  it "should denormalize the relationships" do
    status = subject.worksheet_headers.index("Status")

    expect(
      subject.worksheet_data.first[ status ]
    ).to eq(client_link.status.name)
  end
end
