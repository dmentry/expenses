# if Gem.win_platform?
#   Encoding.default_external = Encoding.find(Encoding.locale_charmap)
#   Encoding.default_internal = __ENCODING__
#   [STDIN, STDOUT].each do |io|
#     io.set_encoding(Encoding.default_external, Encoding.default_internal)
#   end
# end

require "rexml/document"
require "date"

path = File.join(__dir__, "my_expenses.xml")

abort "Файл my_expenses.xml не найден." unless File.exist?(path)

file = File.new(path)

doc = REXML::Document.new(file)

file.close

amount_per_day = Hash.new

doc.elements.each("expenses/expense") do |element|
  loss_summ = element.attributes["amount"].to_i
  loss_date = Date.parse(element.attributes["date"])

  amount_per_day[loss_date] ||= 0

  amount_per_day[loss_date] += loss_summ
end

current_month = amount_per_day.keys.sort[0].strftime("%B %Y")

summ_per_month = Hash.new

amount_per_day.keys.sort.each do |key|
  summ_per_month[key.strftime("%B %Y")] ||= 0
  summ_per_month[key.strftime("%B %Y")] += amount_per_day[key]
end

puts "------[ #{current_month}, всего потрачено: " +
  "#{summ_per_month[current_month]} р. ]--------"

amount_per_day.keys.sort.each do |key|
  if key.strftime("%B %Y") != current_month
    current_month = key.strftime("%B %Y")
    puts "------[ #{current_month}, всего потрачено: " +
    "#{summ_per_month[current_month]} р. ]--------"
  end

  puts "\t#{key.day} число: #{amount_per_day[key]} р."
end
