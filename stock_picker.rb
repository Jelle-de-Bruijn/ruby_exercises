def stock_picker(price_array)
    delta_hash = Hash.new(0)
    begin_day = -1
    i = 0
    price_array.each do |price_1|
        begin_day += 1
        end_day = 0
        price_array.each do |price_2|
            delta_hash[[begin_day, end_day]] = price_2 - price_1
            end_day += 1
        end
    end

    delta_hash.reject! { |key, value| key[0] > key[1]}
    return delta_hash.key(delta_hash.values.max)
end
puts stock_picker([17,3,6,9,15,8,6,1,10])