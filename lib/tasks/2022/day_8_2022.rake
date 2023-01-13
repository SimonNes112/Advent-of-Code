namespace :day_8_2022 do
    desc "day 8"
    task go: :environment do
        # Part 1
        data = File.readlines("data/2022/day_8.txt")
        
        
        #map the data and chomp it
        trees = data
            .map(&:chomp)
            .map {_1.chars}
            .map {_1.map(&:to_i)}
          
        # check if the trees are visible
        def check_visible(trees, i, j)
            height = trees[i][j]
            row = trees[i]
            col = trees.transpose[j]
          
            return 1 if i == 0 || j == 0 || i == trees.length - 1 || j == trees.first.length - 1
            return 1 if height > row[0...j].max
            return 1 if height > row[j+1..-1].max
            return 1 if height > col[0...i].max
            return 1 if height > col[i+1..-1].max
          
            0
        end
        # check the visibility
          
        def visibility(trees)
            trees.length.times.flat_map do |i|
              trees.first.length.times.map do |j|
                #check_visible(trees, i, j)
                # Part 2
                scenic_score(trees, i, j)
              end
            end
        end
        # Part 2
        def scenic_score(trees, i, j)
            # set the height to the trees The row and the column
            height = trees[i][j]
            row = trees[i]
            col = trees.transpose[j]
            scores = []
          
            # To the left
            # set the score to 0
            score = 0
            # loop through the row and check if the row is bigger than the height
            (j-1).downto(0).each do |k|
              score += 1
              break if row[k] >= height
            end
            scores << score
          
            # To the right
            score = 0
            (j+1...trees.first.length).each do |k|
              score += 1
              break if row[k] >= height
            end
            # add the score to the scores
            scores << score
          
            # Above
            score = 0
            (i-1).downto(0).each do |k|
              score += 1
              break if col[k] >= height
            end
            scores << score
          
            # Below
            
            score = 0
            (i+1...trees.length).each do |k|
              score += 1
              break if col[k] >= height
            end
            scores << score
            # return the scores
            scores.inject(:*)
        end
        #part 1 answer
        # puts visibility(trees)
        #part 2 answer
        puts visibility(trees).max
    end
end