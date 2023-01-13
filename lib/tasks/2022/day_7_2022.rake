namespace :day_7_2022 do
    desc "day 7"
    task go: :environment do
        #Part 1
        data = File.readlines('data/2022/day_7.txt')
        # data = File.readlines('data/day_7_test.txt')
        cwd = []
        #make a hash of the directories and their sizes
        dir_sizes = Hash.new { |h, k| h[k] = 0 }
        #loop through the data 
        data
            .map(&:chomp)
            .map{_1.split(' ')}
            # doing pattern matching  on the data
            .each do |line|
              case line
              in ['$', 'cd', '..']
                cwd.pop
              in ['$', 'cd', dir]
                cwd << dir
              in ['$', 'ls']
              in ['dir', dirname]
              in [size, filename]
                cwd.length.times do |x|
                  dir_sizes[cwd[0..x]] += size.to_i
                end
              end
            end
          #part 1 answer
          puts dir_sizes
            .inject(0) {|sum, (_, size)| size <= 100000 ? sum + size : sum}
          
          #part 2
          #total size of the disk
          total = 70000000
          #size needed
          needed = 30000000
          #free space
          free = total - dir_sizes[['/']]
          #how much space we need to delete
          delete_at_least = needed - free
          
          puts "Total: #{total}, Free: #{free}, Needed: #{needed}, Delete at least: #{delete_at_least}"
          #part 2 answer
          puts dir_sizes.values.sort.find { |size| size > delete_at_least }



        
    end
end