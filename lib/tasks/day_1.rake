
namespace :day_1 do
    desc "day 1"

    task update: :environment do
        number = open("app/data/day_1.txt").read
        elfs = number.split("\n\n")

        result = elfs.map do |elf|
            
            elf.split("\n").map(&:to_i).sum
        end
        puts result.max
        puts result.max(3).sum
    end
end