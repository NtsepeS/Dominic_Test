require 'rails_helper'

RSpec.describe BaseStationUnit, :type => :model do

  # core node
  let (:c1) { Container.new }
  let (:cn) { CoreNode.new name: "Bryanston Towers", container: c1 }

  # base station unit
  let (:c2) { c1.children.new }
  let (:bs1) { BaseStationUnit.new name: "Station 2", container: c2 }

  # base station sectors
  let (:c4) { c2.children.new }
  let (:sec1) { BaseStationSector.new name: "Sector 3", container: c4 }

  let (:c5) { c2.children.new }
  let (:sec2) { BaseStationSector.new name: "Sector 4", container: c5 }

  it 'has a container linked to it' do
    expect(bs1.container).to eq(c2)
  end

  context 'responds to its methods' do
    it { expect(bs1).to respond_to(:parent) }
    it { expect(bs1).to respond_to(:children) }
    it { expect(bs1).to respond_to(:base_station_sectors) }
    it { expect(bs1).to respond_to(:core_node) }
  end

  context 'executes methods correctly' do
    before :each do
      c1.save
      cn.save
      c2.save
      bs1.save
      c4.save
      sec1.save
      c5.save
      sec2.save
    end

    it 'will delegate children method call to attached container' do
      expect(bs1.children).to eq(c2.children)
    end

    it 'will delegate parent method call to attached container' do
      expect(bs1.parent).to eq(c2.parent)
    end

    it 'will return its parent core node' do
      expect(bs1.core_node).to eq(cn)
    end

    it 'will return a list of base station sectors' do
      expect(bs1.base_station_sectors).to include(sec1, sec2)
    end
  end
end
