# Expenses (Учет трат)
Small terminal application for recording and showing spend amount of money. It provides storing of the values: Name of spending, Category, Amount, Date. It stores data in XML format. Data is presented as monthly spendings by days.

## Run
### Add new spending

```
ruby expenses_writer.rb
```

```
На что потратили деньги?
Игра
Сколько потратили?
2500
Укажите дату траты в формате ДД.ММ.ГГГГ, например 12.05.2003 (пустое поле - сегодня)
   
В какую категорию занести трату
Игры
Информация успешно сохранена
```

### See spendings

```
ruby expenses_reader.rb
```

```
------[ June 2015, всего потрачено: 3500 р. ]--------
	23 число: 3500 р.
------[ July 2015, всего потрачено: 1300 р. ]--------
	1 число: 400 р.
	9 число: 900 р.
------[ August 2015, всего потрачено: 1200 р. ]--------
	14 число: 1200 р.
------[ October 2020, всего потрачено: 5500 р. ]--------
	27 число: 5500 р.
------[ February 2021, всего потрачено: 2500 р. ]--------
	27 число: 2500 р.
```

Or just open `my_expenses.xml` in which all the data is saved (it is created automatically during the first run in root directory of the application).
