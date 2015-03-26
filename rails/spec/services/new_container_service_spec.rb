require 'rails_helper'

describe NewContainerService do
  describe "creating core nodes" do
    let(:core_node) { FactoryGirl.build(:core_node) }

    it "should create a root container" do
      expect {
        subject.create( core_node )
      }.to change {
        Container.count
      }.by( 1 )

      expect( subject.container ).to be_root
    end

    it "should create the core node" do
      expect{
        subject.create( core_node )
      }.to change {
        CoreNode.count
      }.by( 1 )

      expect( core_node ).to be_persisted
    end

    it "should associate the models" do
      subject.create( core_node )
      container = subject.container

      core_node.reload
      container.reload

      expect( core_node.container ).to eq( container )
    end
  end

  describe "creating base station units" do
    let!(:core_node) {
      described_class.new.create( FactoryGirl.create(:core_node) ).containable
      # subject.create( FactoryGirl.create(:core_node) ).containable
    }
    let(:base_station_unit) { FactoryGirl.build(:base_station_unit) }

    it "should require a core node" do
      expect {
        subject.create( base_station_unit )
      }.to_not change {
        BaseStationUnit.count
      }

      expect( subject.errors[:parent] ).to be_present
    end

    it "should create the container" do
      expect {
        subject.create( base_station_unit, in: core_node )
      }.to change {
        Container.count
      }.by( 1 )
    end

    it "should create the model" do
      expect {
        subject.create( base_station_unit, in: core_node )
      }.to change {
        BaseStationUnit.count
      }.by( 1 )

      expect( base_station_unit ).to be_persisted
    end

    it "should associate the containers" do
      subject.create( base_station_unit, in: core_node )

      expect( core_node.base_station_units ).to include( base_station_unit )
      expect( base_station_unit.core_node ).to eq( core_node )
    end
  end

  describe "creating base station sectors" do
    let!(:core_node) {
      described_class.new.create( FactoryGirl.build(:core_node) ).containable
    }
    let!(:base_station_unit) {
      described_class.new.create(
        FactoryGirl.build(:base_station_unit), in: core_node
      ).containable
    }
    let(:base_station_sector) { FactoryGirl.build(:base_station_sector) }

    it "should require a base station unit" do
      expect {
        subject.create( base_station_sector )
      }.to_not change {
        BaseStationSector.count
      }

      expect( subject.errors[:parent] ).to be_present
    end

    it "should create the container" do
      expect {
        subject.create( base_station_sector, in: base_station_unit )
      }.to change {
        Container.count
      }.by( 1 )
    end

    it "should create the model" do
      expect {
        subject.create( base_station_sector, in: base_station_unit )
      }.to change {
        BaseStationSector.count
      }.by( 1 )
    end

    it "should associate the containers" do
      subject.create( base_station_sector, in: base_station_unit )

      expect( core_node.base_station_sectors ).to include( base_station_sector )
      expect( base_station_unit.base_station_sectors ).to include( base_station_sector )
      expect( base_station_sector.core_node ).to eq( core_node )
    end
  end

  describe "creating client links" do
    let!(:core_node) {
      subject.create( FactoryGirl.build(:core_node) ).containable
    }
    let!(:base_station_unit) {
      subject.create(
        FactoryGirl.build(:base_station_unit), in: core_node
      ).containable
    }
    let!(:base_station_sector) {
      subject.create(
        FactoryGirl.build(:base_station_sector), in: base_station_unit
      ).containable
    }
    let(:client_link) { FactoryGirl.build(:client_link) }

    it "should require a base station sector" do
      expect {
        subject.create( client_link )
      }.to_not change {
        ClientLink.count
      }
    end

    it "should create the container" do
      expect {
        subject.create( client_link, in: base_station_sector )
      }.to change {
        Container.count
      }.by ( 1 )
    end

    it "should create the model" do
      expect {
        subject.create( client_link, in: base_station_sector )
      }.to change {
        ClientLink.count
      }.by ( 1 )
    end

    it "should associate the containers" do
      subject.create( client_link, in: base_station_sector )

      expect( core_node.client_links ).to include( client_link )
      expect( base_station_sector.client_links ).to include( client_link )
      expect( client_link.core_node ).to eq( core_node )
      expect( client_link.base_station_unit ).to eq( base_station_unit )
      expect( client_link.base_station_sector ).to eq( base_station_sector )
    end
  end
end
