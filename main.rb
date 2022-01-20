
def palindrome?(str)
    str = str.downcase.gsub(/[^0-9A-Za-z]/, '').gsub(/[[:space:]]/, '')
    str.eql? str.reverse
end