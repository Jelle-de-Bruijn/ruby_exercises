def caesar_cipher(string_, n)
    cipher_array = []
    encoded_string = ""
    character_array = string_.split("")

    character_array.map! { |character| character.ord.to_i}
    character_array.each do |character|
        if character > 96 && character < 123
            cipher_array.push(character + n)
        else
            cipher_array.push(character)
        end
    end

    cipher_array.map! do |character|
        if character > 122
            character -= 26
        else
            character += 0
        end
    end
    cipher_array.map { |character| character.chr}
    cipher_array.map { |character| encoded_string.concat(character)}
    return encoded_string
end
puts caesar_cipher("jelle de bruijn , 18 jaar!", 25)

