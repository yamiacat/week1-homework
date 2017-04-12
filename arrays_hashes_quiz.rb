### A. Given the following data structure:

lines = ['Gyle Centre', 'Edinburgh Park', 'Murrayfield Stadium', 'Haymarket', 'Princes Street']

# 1. Work out how many stops there are in the array
puts 1
puts lines.length()

# 2. Return 'Edinburgh Park' from the array
puts 2
puts lines[1]
# 3. How many ways can we return 'Princes Street' from the array?
puts 3
puts lines[4]
puts lines[-1]
puts lines.drop(4)
puts lines.last()
puts lines.pop()

# 4. Work out the index position of 'Haymarket'
puts 4
puts "Haymarket is at index position 3."
# 5. Add 'Airport' to the start of the array
puts 5
lines.unshift("Airport")
puts lines.join(", ")
# 6. Add 'York Place' to the end of the array
puts 6
lines.push("York Place")
puts lines.join(", ")
# 7. Remove 'Edinburgh Park' from the array using it's name
puts 7
lines.delete("Edinburgh Park")
puts lines.join(", ")
# 8. Delete 'Edinburgh Park' from the array by index
puts 8
lines.delete_at(2)
puts lines.join(", ")
# 9. Reverse the positions of the stops in the array
puts 9
puts lines.reverse()

### B. Given the following data structure:

my_hash = {"0" => "Zero", 1 => "One", :two => "Two", "two" => 2}

# 1. How would you return the string `"One"`?
puts 1
puts my_hash[1]
# 2. How would you return the string `"Two"`?
puts 2
puts my_hash[:two]
# 3. How would you return the number `2`?
puts 3
puts my_hash["two"]
# 4. How would you add `{3 => "Three"}` to the hash?
puts 4
my_hash[3] = "Three"
puts my_hash
# 5. How would you add `{:four => 4}` to the hash?
puts 5
my_hash[:four] = 4
puts my_hash

#### C. Given the following data structure:

users = {
  "Jonathan" => {
    :twitter => "jonnyt",
    :favourite_numbers => [12, 42, 75, 12, 5],
    :home_town => "Stirling",
    :pets => {
      "fluffy" => :cat,
      "fido" => :dog,
      "spike" => :dog
    }
  },
  "Erik" => {
    :twitter => "eriksf",
    :favourite_numbers => [8, 12, 24],
    :home_town => "Linithgow",
    :pets => {
      "nemo" => :fish,
      "kevin" => :fish,
      "spike" => :dog,
      "rupert" => :parrot
    }
  },
  "Avril" => {
    :twitter => "bridgpally",
    :favourite_numbers => [12, 14, 85, 88],
    :home_town => "Dunbar",
    :pets => {
      "colin" => :snake
    }
  }
}

# 1. Return Jonathan's Twitter handle (i.e. the string `"jonnyt"`)
puts 1
jons_handle = users["Jonathan"][:twitter]
puts jons_handle
# 2. Return Erik's hometown
puts 2
eriks_town = users["Erik"][:home_town]
puts eriks_town
# 3. Return the array of Erik's favorite numbers
puts 3
eriks_fave_number = users["Erik"][:favourite_numbers]
puts eriks_fave_number
# 4. Return the type of Avril's pet Colin
puts 4
avrils_pet = users["Avril"][:pets]["colin"]
puts avrils_pet
# 5. Return the smallest of Erik's favorite numbers
puts 5
eriks_smallest_fave_number = eriks_fave_number.sort.shift
puts eriks_smallest_fave_number
# 6. Add the number `7` to Erik's favorite numbers
puts 6
eriks_fave_number << 7
puts eriks_fave_number
# 7. Change Erik's hometown to Edinburgh
puts 7
users["Erik"][:home_town] = "Edinburgh"
puts users["Erik"][:home_town]
# 8. Add a pet dog to Erik called "Fluffy"
puts 8
users["Erik"][:pets]["Fluffy"] = :dog
puts users["Erik"][:pets]
# 9. Add yourself to the users hash
puts 9
users["Matt"] = {
  :twitter => "mrjesslynnrose",
  :favourite_numbers => [13, 23],
  :home_town => "Birmingham",
  :pets => {
    "Battle-Cat" => :imaginary,
    "Jessie" => :wife
  }
}

puts users["Matt"]
