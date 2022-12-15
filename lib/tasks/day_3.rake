namespace :day_3 do
    desc "day 3"
    task go: :environment do
        #Part 1 
        #setting the total to 0
        total = 0
        #mapping the letters to numbers
        mappings = {
            "a" => 1,
            "b" => 2,
            "c" => 3,
            "d" => 4,
            "e" => 5,
            "f" => 6,
            "g" => 7,
            "h" => 8,
            "i" => 9,
            "j" => 10,
            "k" => 11,
            "l" => 12,
            "m" => 13,
            "n" => 14,
            "o" => 15,
            "p" => 16,
            "q" => 17,
            "r" => 18,
            "s" => 19,
            "t" => 20,
            "u" => 21,
            "v" => 22,
            "w" => 23,
            "x" => 24,
            "y" => 25,
            "z" => 26,
            "A" => 27,
            "B" => 28,
            "C" => 29,
            "D" => 30,
            "E" => 31,
            "F" => 32,
            "G" => 33,
            "H" => 34,
            "I" => 35,
            "J" => 36,
            "K" => 37,
            "L" => 38,
            "M" => 39,
            "N" => 40,
            "O" => 41,
            "P" => 42,
            "Q" => 43,
            "R" => 44,
            "S" => 45,
            "T" => 46,
            "U" => 47,
            "V" => 48,
            "W" => 49,
            "X" => 50,
            "Y" => 51,
            "Z" => 52,
        }
        #opening the file
        backpack = open("data/day_3.txt").read
        #splitting the file at "\n"
        backpack.split("\n").each do |contents|
            #split it at ""
            items = contents.split("")
            # putting the items in groups of 2
            parts = items.in_groups_of(items.size/2)
            #getting the first half and second half
            first_half = parts[0].join
            second_half = parts[1].join
            #comparing the first half to the second half
            first_half.split('').each do |contents|
                if second_half.include?(contents)
                    #if it includes it, add the value to the total
                    total += mappings[contents]
                    # puts total
                    #break out of the loop
                    break
                end
            end
        end
        #Part 2
        #setting the total to 0
        total_2 = 0
        # making emty array
        array = []
        #splitting the file at "\n"
        array = backpack.split("\n")
        #splitting the array into groups of 3
        array.each_slice(3) do |contents|
            #splitting the first array at ""
            contents[0].split('').each do |l|
                #if the second array and the third array includes the letter
                if contents[1].include?(l) && contents[2].include?(l)
                    #add the value to the total
                    puts total_2 += mappings[l]
                    break
                end
            end
        end
    end
end