require 'rails_helper'

RSpec.describe BaseStationSector, :type => :model do

  # core node
  let (:c1) { Container.new }
  let (:cn) { CoreNode.new name: "Bryanston Towers", container: c1 }

  # base station unit
  let (:c2) { c1.children.new }
  let (:bs1) { BaseStationUnit.new name: "Station 2", container: c2 }

  # base station sectors
  let (:c4) { c2.children.new }
  let (:sec) { BaseStationSector.new name: "Sector 3", container: c4 }

  # client links
  let (:c6) { c4.children.new }
  let (:cl) { ClientLink.new name: "Client Link 1", container: c6 }

  let (:c7) { c4.children.create! }
  let (:cl2) { ClientLink.create! name: "Client Link 2", container: c7 }

  it 'has a container linked to it' do
    expect(sec.container).to eq(c4)
  end

  context 'responds to its methods' do
    it { expect(sec).to respond_to(:parent) }
    it { expect(sec).to respond_to(:children) }
    it { expect(sec).to respond_to(:core_node) }
    it { expect(sec).to respond_to(:base_station_unit) }
    it { expect(sec).to respond_to(:client_links) }
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
      c7.save
      cl2.save
    end

    it 'will delegate children method call to attached container' do
      expect(sec.children).to eq(c4.children)
    end

    it 'will delegate parent method call to attached container' do
      expect(sec.parent).to eq(c4.parent)
    end

    it 'will return its parent core node' do
      expect(sec.core_node).to eq(cn)
    end

    it 'will return its parent base station unit' do
      expect(sec.base_station_unit).to eq(bs1)
    end

    it 'will return a list of client links' do
      expect(sec.client_links).to include(cl, cl2)
    end
  end
end
