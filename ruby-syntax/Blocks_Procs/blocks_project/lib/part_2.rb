# array of words
def all_words_capitalized? (array)
  array.all? {|word| word == word.capitalize}
end

# array of urls: ["appacademy.io", "sennacy.com", "heyprogrammers.org"] ==> true
def no_valid_url? (array)
  valid_endings = ['io', 'com', 'org', 'net']
  array.none? do |url|
    url_arr = url.split('.')
    valid_endings.include?(url_arr[1])
  end
end

# array of student hashes: [{:name=>"Alice", :grades=>[60, 68]}, {:name=>"Bob", :grades=>[20, 100]}] => false
# grade of 75 average or higher is passing
def any_passing_students? (array)
  array.any? {|student| average(student[:grades]) > 75}
end

def average (arr)
  arr.sum / arr.length
end