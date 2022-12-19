namespace :day_5 do
    desc "day 5"
    task go: :environment do
        #Part 1
        crates = [[], [], [], [], [], [], [], [], []]
        mapping = [1, 5, 9, 13, 17, 21, 25, 29, 33]

        File.readlines('data/2022/day_5.txt').each do |line|
            # Store the layout of the crates
            if line.include?('[')
                mapping.each_with_index do |v, k|
                #Remove any whitespace and push the value into the crates array
                crates[k].push(line[v]) if line[v] && !line[v].strip.empty?
                end
            elsif line.include?('move')
                # scan returns all results from a regex in an array, the regex
                # simply extracts the values between any square brackets
                # e.g. "test 5 test 6" would result in ["5", "6"]
                amount, from, to = line.scan(/\d+/).map(&:to_i)
                
                crates_to_move = crates[from - 1].shift(amount)
                #crates[to - 1] = crates_to_move.reverse.concat(crates[to - 1])
                #Part 2 
                #Change reverse to concat so that the Crane move multiple crates at once
                crates[to - 1] = crates_to_move.concat(crates[to - 1])
            end
        end

        crates.each do |c|
            # Print The top crate of each of each row of crates
            puts c[0]   
        end


    end
end