require "csv"
rows = CSV.table("syukujitsu.csv")

h = {}
rows.each do |row|
  row.each_slice(2).to_a.each do |(_, name), (_, time)|
    begin
      h[Date.parse(time).to_s] = name
    rescue
    end
  end
end

p h.group_by {|key, val| key[0,4]}.inject({}){|h, (key, val)| h[key] = val.to_h;h}