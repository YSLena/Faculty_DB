# Faculty_DB

Навчальна БД Faculty_UA_22 створена в СУБД MS SQL Server на основі реальних даних оперативного контролю відвідування занять та успішності студентів факультету № 3 ХАІ у квітні 2012 р. Дані були обфусційовані шляхом перемішування імен та побатькові реальних людей.

Для створення БД виконайте скрипт Faculty_UA_22.sql в MS SQL Server Management Studio або Visual Studio. Перед запуском сценарію відредагуйте команду CREATE DATABASE, вказавши шлях до каталогу, в которому ви хочете створити базу (рядки 7 та 9). Каталог повинен існувати. В шляху до каталогу уникайте символів кирилиці, пробілів та інших спецсимволів, це може створити проблеми при роботі зі строкою підключення. Скрипт сумісний з версіями MS SQL 2016 та вище
