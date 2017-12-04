module AddressesHelper

  def display_address(address)
    base_address = "#{address.city}, #{address.state.abbreviation} #{address.zip}"
    if address.street_2.empty?
      "#{address.street_1}, " + base_address
    else
      "#{address.street_1}, #{address.street_2}, " + base_address
    end
  end
end
