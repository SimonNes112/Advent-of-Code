namespace :day_2 do
    desc "day_2"
    task go: :environment do 
        number = open("data/2022/day_2.txt").read
        # Part 1
        mappings = {
            "A" => 0, #ROck
            "B" => 1, # paper
            "C" => 2, # scissor
            "X" => 0, # lose
            "Y" => 1, # draw
            "Z" => 2  # win
        }
        points =[
            
            [(3+1), (0+1), (6+1)], #A
            [(6+2), (3+2), (0+2)], #B
            [(0+3), (6+3), (3+3)]  #C
        ]
        number_split = number.split("\n")
        point_all = number_split.map do |number|
            elfs, me  = number.split(" ")
            points[mappings[me]][mappings[elfs]]
        end
        puts point_all.sum
        # Part 2
        points_2 =[
            #X       Y       Z
            [(3+0), (1+3), (2+6)], #A
            [(1+0), (2+3), (3+6)], #B
            [(2+0), (3+3), (1+6)]  #C
        ]
        point_all_2 = number_split.map do |number|
            elfs, outcome  = number.split(" ")
            points_2[mappings[elfs]][mappings[outcome]]
        end
        puts point_all_2.sum



        
        
    end
    
end