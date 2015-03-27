require 'rails_helper'

RSpec.describe CoreNode, :type => :model do

  # core node
  let (:c1) { Container.new }
  let (:cn) { CoreNode.new name: "Bryanston Towers", container: c1 }

  # base station unit
  let (:c2) { c1.children.new }
  let (:bs1) { BaseStationUnit.new name: "Station 2", container: c2 }

  let (:c3) { c1.children.new }
  let (:bs2) { BaseStationUnit.new name: "Station 4", container: c3 }

  # base station sector
  let (:c4) { c2.children.new }
  let (:sec) { BaseStationSector.new name: "Sector 3", container: c4 }

  # client link
  let (:c6) { c4.children.new }
  let (:cl) { ClientLink.new name: "Client Link 1", container: c6 }

  it 'has a container linked to it' do
    expect(cn.container).to eq(c1)
  end

  context 'responds to its methods' do
    it { expect(cn).to respond_to(:children) }
    it { expect(cn).to respond_to(:base_station_units) }
    it { expect(cn).to respond_to(:base_station_sectors) }
    it { expect(cn).to respond_to(:client_links) }
  end

  context 'executes methods correctly' do
    before :each do
      c1.save
      cn.save
      c2.save
      bs1.save
      c3.save
      bs2.save
      c4.save
      sec.save
      c6.save
      cl.save
    end

    it 'will delegate children method call to attached container' do
      expect(cn.children).to eq(c1.children)
    end

    it 'will return a list of base station units' do
      expect(cn.base_station_units).to include(bs1, bs2)
    end

    it 'will return a list of base station sectors' do
      expect(cn.base_station_sectors).to include(sec)
    end

    it 'will return a list of client links' do
      expect(cn.client_links).to include(cl)
    end
  end

  context "destroying" do
    before(:each) do
      @core_node = create_core_node
    end

    it "should remove its container" do
      expect {
        @core_node.destroy
      }.to change {
        Container.count
      }.by( -1 )
    end
  end
end
