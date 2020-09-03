def substrings(str, dic)

    str = str.split(/[^a-zA-Z]+/)
    puts str.map! { |s| s.downcase}

    dictionary = dic.map { |i| i.downcase}

    count = Hash.new(0)

    dictionary.each do |dic|
        str.each do |s|
            if s.include?(dic) == true
                count[dic] = count[dic] + 1
            end
        end
    end
    puts count
end
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?", dictionary)
