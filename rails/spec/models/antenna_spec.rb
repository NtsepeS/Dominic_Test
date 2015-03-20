require 'rails_helper'

RSpec.describe Antenna, :type => :model do
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

  # antenna
  let (:a) { Antenna.new serial_number: 'ant-1', client_link: cl }

  context 'methods' do
    it 'should respond' do
      %i{ core_node base_station_unit base_station_sector client_link }.each do |method|
        expect(a).to respond_to(method)
      end
    end
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
      a.save
    end

    it 'returns parent core node' do
      expect(a.core_node).to eq(cn)
    end

    it 'returns parent base station unit' do
      expect(a.base_station_unit).to eq(bs1)
    end

    it 'returns parent base station sector' do
      expect(a.base_station_sector).to eq(sec)
    end

    it 'returns parent client link' do
      expect(a.client_link).to eq(cl)
    end
  end
end

