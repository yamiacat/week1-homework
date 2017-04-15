def pet_shop_name(shop_name)
  return shop_name[:name]
end

def total_cash(shop_name)
  return shop_name[:admin][:total_cash]
end

def add_or_remove_cash(shop_name, amount)
  return shop_name[:admin][:total_cash] += amount
end

def pets_sold(shop_name)
  return shop_name[:admin][:pets_sold]
end

def increase_pets_sold(shop_name, number_sold)
  return shop_name[:admin][:pets_sold] += number_sold
end

def stock_count(shop_name)
  return shop_name[:pets].length
end


#TDD DID NOT MAKE THE BELOW!

# def pets_by_breed(shop_name, searched_for_breed)
#   examples_of_searched_for_breed = []
#   shop_name[:pets].each do |animal|
#     if animal[:breed] == searched_for_breed
#       examples_of_searched_for_breed << animal
#     else
#       next
#     end
#   end
#   return examples_of_searched_for_breed
# end

#TDD ATTEMPT TWO
## GAH, STILL NOT REALLY TDD
#HOW DO YOU JUMP FROM SENDING BACK A FIXED ARRAY TO WRITING THE CODE!?

def pets_by_breed(shop_name, searched_for_breed)
  found_breeds = []
  shop_name[:pets].each do |animal|
    if searched_for_breed == animal[:breed]
      found_breeds << animal
    else
      next
    end
  end
  return found_breeds
end

#JOHNNY'S SMOOVE VERSION
#
# def pets_by_breed(pet_shop, searched_for_breed)
#   return pet_shop[:pets].select {|animal| animal[:breed] == searched_for_breed}
# end

# def find_pet_by_name(pet_shop, searched_name)
#   pet_shop[:pets].each do |animal|
#     if animal[:name] == searched_name
#       return animal
#     elsif animal[:name] != searched_name
#       next
#     else
#     end
#   end
#   return nil
# end

# REFACTORED TERNARY VERSION

def find_pet_by_name(pet_shop, searched_name)
  pet_shop[:pets].each do |animal|
    (animal[:name] == searched_name) ? (return animal): next
  end
  return nil
end


def remove_pet_by_name(pet_shop, pet_to_be_removed)
  target_for_deletion = find_pet_by_name(pet_shop, pet_to_be_removed)
  pet_shop[:pets].delete(target_for_deletion)
end

def add_pet_to_stock(pet_shop, added_pet)
  pet_shop[:pets]  << added_pet
  return nil
end

def customer_pet_count(customer_index)
  return customer_index[:pets].count
end

def add_pet_to_customer(customer, added_pet)
  customer[:pets] << added_pet
  return nil
end

# OPTIONAL

def customer_can_afford_pet(customer_index, pet_to_buy)
  pet_to_buy[:price] <= customer_index[:cash] ? (return true): (return false)
end

def sell_pet_to_customer(pet_shop, sold_pet, customer)
  if nil == sold_pet
    return
  else
    if customer_can_afford_pet(customer, sold_pet) == true
      add_pet_to_customer(customer, sold_pet)
      remove_pet_by_name(pet_shop, sold_pet)
      pet_shop[:admin][:pets_sold] += 1
      add_or_remove_cash(pet_shop, sold_pet[:price])
      customer[:cash] -= sold_pet[:price]
    else
      return
    end
  end
end
