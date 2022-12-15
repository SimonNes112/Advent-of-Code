namespace :day_4 do
    desc "day 4"
    task go: :environment do
        #Part 1
        #setting the total to 0
        total_overlap = 0
        File.open("data/day_4.txt").each do |line|
            tasks = line.split(",")
            #spliting the tasks at "-"
            #making the first part and the second part a integer
            first_part = tasks.first.split("-").map(&:to_i)
            second_part = tasks.last.split("-").map(&:to_i)
            # making a range of the first part
            range = (first_part[0]..first_part[1]).to_a
            range_two = (second_part[0]..second_part[1]).to_a
            # if the first part is equal to the second part
            # or if the second part is equal to the first part
            if (range.include?(second_part[0]) && range.include?(second_part[1])) || (range_two.include?(first_part[0]) && range_two.include?(first_part[1])) || (range.include?(second_part[0]) && range_two.include?(first_part[1])) || (range_two.include?(first_part[0]) && range.include?(second_part[1]))
                #if the first part is equal to the second part
                total_overlap += 1
            end
        end
        # printing the total overlap
        puts total_overlap
    end
end