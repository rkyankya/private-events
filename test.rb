mh = {"2"=>"1", "3"=>"0", "4"=>"0", "5"=>"0"}
mh.each do |x|
  p x[0].to_i if x[1] == "1"
end