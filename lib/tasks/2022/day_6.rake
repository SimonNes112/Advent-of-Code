namespace :day_6 do
    desc "day 6"
    task go: :environment do
        #Part 1
        #setting the left postion and the right postion to 0 and current to ""
        left_postion = 0
        right_postion = 0
        current = ""
        #reading the file
        basis = open("data/2022/day_6.txt").read
        #while the right postion is less than the length of the basis
        while right_postion < basis.length - 1 do 
            #if the current length is equal to 4
            #part 1 
            # if current.length == 4
            #     #printing the current
            #     puts right_postion 
            #     break
            # end
            #part 2 
            if current.length == 14
                #printing the current
                puts right_postion 
                break
            end
            #if the current include the basis at the right postion
            if current.include?(basis[right_postion]) 
                #setting the current to "" and the left postion to the right postion
                current = ""
                left_postion += 1
                right_postion = left_postion
            else    
                #setting the current to the current plus the basis at the right postion
                current << basis[right_postion]
                right_postion += 1
            end
        end   
    end
end