def load_input
  File.readlines('day-01.txt')
end

def calculate_fuel(module_mass)
  fuel = module_mass / 3 - 2
  fuel > 0 ? fuel : 0
end

def module_fuel_requirement(remaining_amount, fuel_total = 0)
  return fuel_total if remaining_amount == 0

  fuel_amount = calculate_fuel(remaining_amount)

  module_fuel_requirement(fuel_amount, fuel_total + fuel_amount)
end

total_fuel_requirement = load_input.map { |module_mass|
  calculate_fuel(module_mass.to_i)
}.sum

puts "total fuel requirement = #{total_fuel_requirement}"

complete_fuel_requirement = load_input.map { |module_mass|
  module_fuel_requirement(module_mass.to_i)
}.sum

puts "complete fuel requirement = #{complete_fuel_requirement}"
