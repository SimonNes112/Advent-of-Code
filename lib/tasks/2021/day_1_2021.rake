namespace :day_1_2021 do
    desc "day 1"
    task go: :environment do
        #Part 1
        array = []
        array = File.open("data/2021/day_1.txt")
        array_2 = []
        array_2 = File.open("data/2021/day_1.txt")
        total = 0 
        array.each do |line|
            array_2.each do |line_2|
                if line > line_2(index+1)
                    puts total+1
                    break
                end
            end
            
        end
        

        
    end
end