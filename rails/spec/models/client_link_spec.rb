require 'rails_helper'

RSpec.describe ClientLink, :type => :model do

  # core node
  let (:c1) { Container.new }
  let (:cn) { CoreNode.new name: "Bryanston Towers", container: c1 }

  # base station unit
  let (:c2) { c1.children.new }
  let (:bs1) { BaseStationUnit.new name: "Station 2", container: c2 }

  # base station sector
  let (:c4) { c2.children.new }
  let (:sec) { BaseStationSector.new name: "Sector 3", container: c4 }

  # client links
  let (:c6) { c4.children.new }
  let (:cl) { ClientLink.new name: "Client Link 1", container: c6 }

  it 'has a container linked to it' do
    expect(cl.container).to eq(c6)
  end

  context 'responds to its methods' do
    it { expect(cl).to respond_to(:parent) }
    it { expect(cl).to respond_to(:children) }
    it { expect(cl).to respond_to(:core_node) }
    it { expect(cl).to respond_to(:base_station_unit) }
    it { expect(cl).to respond_to(:base_station_sector) }
  end

  context 'executes methods correctly' do
    before :each do
      c1.save
      cn.save
      c2.save
      bs1.save
      c4.save
      sec.save
      c6.save
      cl.save
    end

    it 'will delegate children method call to attached container' do
      expect(cl.children).to eq(c6.children)
    end

    it 'will delegate parent method call to attached container' do
      expect(cl.parent).to eq(c6.parent)
    end

    it 'will return its parent core node' do
      expect(cl.core_node).to eq(cn)
    end

    it 'will return its parent base station unit' do
      expect(cl.base_station_unit).to eq(bs1)
    end

    it 'will return its parent base station sector' do
      expect(cl.base_station_sector).to eq(sec)
    end
  end
end
