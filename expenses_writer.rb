if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__
  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require "rexml/document"
require "date"

puts 'На что потратили деньги?'
expense_text = STDIN.gets.chomp

puts 'Сколько потратили?'
expense_amount = STDIN.gets.to_i

puts "Укажите дату траты в формате ДД.ММ.ГГГГ, например 12.05.2003 (пустое поле - сегодня)"
date_input = STDIN.gets.chomp

expense_date = nil

if expense_date == ""
  expense_date = Date.today
else
  begin
    expense_date = Date.parse(date_input)
  rescue ArgumentError
    expense_date = Date.today
  end
end

puts 'В какую категорию занести трату'
expense_category = STDIN.gets.chomp

file_name = File.join(__dir__, "my_expenses.xml")
file = File.new(file_name, "r:UTF-8")
doc = REXML::Document.new(file)
file.close

expenses = doc.elements.find("expenses").first

expense = expenses.add_element "expense", {
  "date" => expense_date.to_s,
  "category" => expense_category,
  "amount" => expense_amount
}

expense.text = expense_text

file = File.new(file_name, "w:UTF-8")
doc.write(file, 2)
file.close

puts 'Информация успешно сохранена'
