require 'minitest/autorun'
require_relative '../pet_shop'
require "minitest/rg"

class TestPetShop < Minitest::Test

  def setup

    @customers = [
      {
        name: "Craig",
        pets: [],
        cash: 1000
      },
      {
        name: "Zsolt",
        pets: [],
        cash: 50
      }
    ]

    @new_pet = {
            name: "Bors the Younger",
            pet_type: :cat,
            breed: "Cornish Rex",
            price: 100
          }

    @pet_shop = {
        pets: [
          {
            name: "Sir Percy",
            pet_type: :cat,
            breed: "British Shorthair",
            price: 500
          },
          {
            name: "King Bagdemagus",
            pet_type: :cat,
            breed: "British Shorthair",
            price: 500
          },
          {
            name: "Sir Lancelot",
            pet_type: :dog,
            breed: "Pomsky",
            price: 1000,
          },
          {
            name: "Arthur",
            pet_type: :dog,
            breed: "Husky",
            price: 900,
          },
          {
            name: "Tristan",
            pet_type: :dog,
            breed: "Basset Hound",
            price: 800,
          },
          {
            name: "Merlin",
            pet_type: :cat,
            breed: "Egyptian Mau",
            price: 1500,
          }
        ],
        admin: {
          total_cash: 1000,
          pets_sold: 0,
        },
        name: "Camelot of Pets"
      }


      @pet_shop_2 = {
          pets: [
          {
            name: "Bathsheba",
            pet_type: :cat,
            breed: "Egyptian Queen",
            price: 5_000
          }
        ],
        name: "Fancy Pants Pets",
        admin: {
          total_cash: 2000,
          pets_sold: 2
        }
      }

  end
#====================================================

# PET SHOP NAME
#=============================

  def test_pet_shop_name
    name = pet_shop_name(@pet_shop)
    assert_equal("Camelot of Pets", name)
  end

  def test_pet_shop_other_name
    name = pet_shop_name(@pet_shop_2)
    assert_equal("Fancy Pants Pets", name)
  end

# TOTAL CASH
#==============================

  def test_total_cash
    sum = total_cash(@pet_shop)
    assert_equal(1000, sum)
  end

  def test_total_cash_of_pet_shop_2
    sum = total_cash(@pet_shop_2)
    assert_equal(2000, sum)
  end

# ADD OR REMOVE CASH
#================================

  def test_add_or_remove_cash__add
    add_or_remove_cash(@pet_shop,10)
    cash = total_cash(@pet_shop)
    assert_equal(1010, cash)
  end


  def test_add_or_remove_cash__remove
    add_or_remove_cash(@pet_shop_2,-100)
    cash = total_cash(@pet_shop_2)
    assert_equal(1900, cash)
  end

# PETS SOLD
#=======================

  def test_pets_sold
    sold = pets_sold(@pet_shop)
    assert_equal(0, sold)
  end

  def test_pets_sold_not_hardcoded
    assert_equal(2, pets_sold(@pet_shop_2))

  end

# INCREASE PETS SOLD
#=================================

  def test_increase_pets_sold
    increase_pets_sold(@pet_shop,2)
    sold = pets_sold(@pet_shop)
    assert_equal(2, sold)
  end

  def test_increase_pets_sold_not_hardcoded
    increase_pets_sold(@pet_shop, 4)
    assert_equal(4, pets_sold(@pet_shop))
  end

# STOCK COUNT
#==============================

  def test_stock_count
    count = stock_count(@pet_shop)
    assert_equal(6, count)
  end

  def test_stock_count_not_hardcoded
    assert_equal(1, stock_count(@pet_shop_2))
  end

# ALL PETS BY BREED
#===================================

  def test_all_pets_by_breed__found
    pets = pets_by_breed(@pet_shop, "British Shorthair")
    assert_equal(2, pets.count)
  end

  def test_all_pets_by_breed_not_hardcoded
    pets = pets_by_breed(@pet_shop, "Husky")
    assert_equal(1, pets.count)
  end

  def test_all_pets_by_breed__found_not_hardcoded
    pets = pets_by_breed(@pet_shop_2, "Egyptian Queen")
    assert_equal(1, pets.count)
  end

  def test_all_pets_by_breed__not_found
    pets = pets_by_breed(@pet_shop, "Dalmation")
    assert_equal(0, pets.count)
  end

# FIND PET BY NAME
#==============================

  def test_find_pet_by_name__returns_pet
    pet = find_pet_by_name(@pet_shop, "Arthur")
    assert_equal("Arthur", pet[:name])
  end

  def test_find_pet_by_name_not_hardcoded
    pet = find_pet_by_name(@pet_shop, "Merlin")
    assert_equal("Merlin", pet[:name])
  end

  def test_find_pet_by_name__returns_nil
    pet = find_pet_by_name(@pet_shop, "Fred")
    assert_equal(nil, pet)
  end

  # GOT THE FOLLOWING WARNING BUT DON'T THINK IT MATTERS?
    # Use assert_nil if expecting nil from
    # specs/pet_shop_spec.rb:214:in
    # `test_find_pet_by_name__returns_nil'.
    # This will fail in MT6.


# REMOVE PET BY NAME
#==================================

  def test_remove_pet_by_name
    remove_pet_by_name(@pet_shop, "Tristan")
    pet = find_pet_by_name(@pet_shop,"Tristan")
    assert_equal(nil, pet)
  end

  def test_remove_pet_by_name_arthur
    remove_pet_by_name(@pet_shop, "Arthur")
    pet = find_pet_by_name(@pet_shop,"Arthur")
    assert_equal(nil, pet)
  end



  # ADD PET TO STOCK
  #================================

  def test_add_pet_to_stock
    add_pet_to_stock(@pet_shop, @new_pet)
    count = stock_count(@pet_shop)
    assert_equal(7, count)
  end

# CUSTOMER PET COUNT
#================================

  def test_customer_pet_count
    count = customer_pet_count(@customers[0])
    assert_equal(0, count)
  end

# ADD PET TO CUSTOMER
#==================================

  def test_add_pet_to_customer
    customer = @customers[0]
    add_pet_to_customer(customer, @new_pet)
    assert_equal(1, customer_pet_count(customer))
  end

  # # OPTIONAL


  # CUSTOMER CAN AFFORD PET
  #==================================

  def test_customer_can_afford_pet__insufficient_funds
    customer = @customers[1]
    can_buy_pet = customer_can_afford_pet(customer, @new_pet)
    assert_equal(false, can_buy_pet)
  end

  def test_customer_can_afford_pet__sufficient_funds
    customer = @customers[0]
    can_buy_pet = customer_can_afford_pet(customer, @new_pet)
    assert_equal(true, can_buy_pet)
  end

  # INTEGRATION TESTS
  #==================================

  # #These are 'integration' tests so we want multiple asserts.
  # #If one fails the entire test should fail

  def test_sell_pet_to_customer__pet_found
    customer = @customers[0]
    pet = find_pet_by_name(@pet_shop,"Arthur")

    sell_pet_to_customer(@pet_shop, pet, customer)

    assert_equal(1, customer_pet_count(customer))
    assert_equal(1, pets_sold(@pet_shop))
    assert_equal(1900, total_cash(@pet_shop))
  end

  def test_sell_pet_to_customer__pet_not_found
    customer = @customers[0]
    pet = find_pet_by_name(@pet_shop,"Dave")

    sell_pet_to_customer(@pet_shop, pet, customer)

    assert_equal(0, customer_pet_count(customer))
    assert_equal(0, pets_sold(@pet_shop))
    assert_equal(1000, total_cash(@pet_shop))
  end

  def test_sell_pet_to_customer__insufficient_funds
    customer = @customers[1]
    pet = find_pet_by_name(@pet_shop,"Arthur")

    sell_pet_to_customer(@pet_shop, pet, customer)

    assert_equal(0, customer_pet_count(customer))
    assert_equal(0, pets_sold(@pet_shop))
    assert_equal(1000, total_cash(@pet_shop))
  end

end
