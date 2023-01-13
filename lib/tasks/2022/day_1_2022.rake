namespace :day_1_2022 do
    desc "day 1"
    task go: :environment do
        #Part 1
        number = open("data/2022/day_1.txt").read
        #spliting the number 
        elfs = number.split("\n\n")
        result = elfs.map do |elf|
            #spliting the number and making it a integer and summing it
            elf.split("\n").map(&:to_i).sum
        end
        #get the biggest number
        puts result.max
        #Part 2
        #getting the 3 biggest numbers and summing them
        puts result.max(3).sum
    end
end