# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# ADDRESS TYPES -------------------
AddressType.find_or_create_by!(name: 'Billing')
AddressType.find_or_create_by!(name: 'Shipping')

# STATES --------------------
state_data = [
  {name: 'Alabama', abbv: 'AL'},
  {name: 'Alaska', abbv: 'AK'},
  {name: 'Arizona', abbv: 'AZ'},
  {name: 'Arkansas', abbv: 'AR'},
  {name: 'California', abbv: 'CA'},
  {name: 'Colorado', abbv: 'CO'},
  {name: 'Connecticut', abbv: 'CT'},
  {name: 'Delaware', abbv: 'DE'},
  {name: 'Florida', abbv: 'FL'},
  {name: 'Georgia', abbv: 'GA'},
  {name: 'Hawaii', abbv: 'HI'},
  {name: 'Idaho', abbv: 'ID'},
  {name: 'Illinois', abbv: 'IL'},
  {name: 'Indiana', abbv: 'IN'},
  {name: 'Iowa', abbv: 'IA'},
  {name: 'Kansas', abbv: 'KS'},
  {name: 'Kentucky', abbv: 'KY'},
  {name: 'Louisiana', abbv: 'LA'},
  {name: 'Maine', abbv: 'ME'},
  {name: 'Maryland', abbv: 'MD'},
  {name: 'Massachusetts', abbv: 'MA'},
  {name: 'Michigan', abbv: 'MI'},
  {name: 'Minnesota', abbv: 'MN'},
  {name: 'Mississippi', abbv: 'MS'},
  {name: 'Missouri', abbv: 'MO'},
  {name: 'Montana', abbv: 'MT'},
  {name: 'Nebraska', abbv: 'NE'},
  {name: 'Nevada', abbv: 'NV'},
  {name: 'New Hampshire', abbv: 'NH'},
  {name: 'New Jersey', abbv: 'NJ'},
  {name: 'New Mexico', abbv: 'NM'},
  {name: 'New York', abbv: 'NY'},
  {name: 'North Carolina', abbv: 'NC'},
  {name: 'North Dakota', abbv: 'ND'},
  {name: 'Ohio', abbv: 'OH'},
  {name: 'Oklahoma', abbv: 'OK'},
  {name: 'Oregon', abbv: 'OR'},
  {name: 'Pennsylvania', abbv: 'PA'},
  {name: 'Rhode Island', abbv: 'RI'},
  {name: 'South Carolina', abbv: 'SC'},
  {name: 'South Dakota', abbv: 'SD'},
  {name: 'Tennessee', abbv: 'TN'},
  {name: 'Texas', abbv: 'TX'},
  {name: 'Utah', abbv: 'UT'},
  {name: 'Vermont', abbv: 'VT'},
  {name: 'Virginia', abbv: 'VA'},
  {name: 'Washington', abbv: 'WA'},
  {name: 'West Virginia', abbv: 'WV'},
  {name: 'Wisconsin', abbv: 'WI'},
  {name: 'Wyoming', abbv: 'WY'}
]

state_data.each do |state|
  State.find_or_create_by!(abbreviation: state[:abbv] ){ |s| s.name = state[:name] }
end





