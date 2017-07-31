# language: ru

Функционал: Разборка внешних обработок
    Как разработчик
    Я хочу иметь возможность разобрать внешние обработки 1С на исходники
    Чтобы выполнять коллективную разработку проекта 1С

Контекст:
    Допустим я подготовил репозиторий и рабочий каталог проекта
    
    И Я копирую файл "fixture.epf" из каталога "tests/fixtures" проекта в подкаталог "build/out" рабочего каталога
    
    Допустим каталог "epf" не существует
    И Я очищаю параметры команды "oscript" в контексте 

Сценарий: Разборка одной внешней обработки с временной базой
    
    Когда Я выполняю команду "oscript" c параметрами "<КаталогПроекта>/src/main.os decompileepf build/out/fixture.epf epf"
    # И Я сообщаю вывод команды "oscript"
    И Вывод команды "oscript" содержит "Разбираю внешнюю обработку build"
    Тогда Код возврата команды "oscript" равен 0
    И файл "epf/fixture/Тест1.xml" существует
    И файл "epf/fixture/Тест1/Ext/ObjectModule.bsl" существует
    И файл "epf/fixture/Тест1/Ext/ObjectModule.bsl" содержит 'Сообщить("Обработка Тест1");'

Сценарий: Разборка каталога внешних обработок с временной базой
    
    Когда Я выполняю команду "oscript" c параметрами "<КаталогПроекта>/src/main.os decompileepf build/out epf"
    И Вывод команды "oscript" содержит "Разбираю внешние обработки из каталога build"
    Тогда Код возврата команды "oscript" равен 0
    И файл "epf/fixture/Тест1.xml" существует
    И файл "epf/fixture/Тест1/Ext/ObjectModule.bsl" существует
    И файл "epf/fixture/Тест1/Ext/ObjectModule.bsl" содержит 'Сообщить("Обработка Тест1");'

Сценарий: Разборка одной внешней обработки с явно заданной базой
    Когда TODO

Сценарий: Разборка каталога внешних обработок с явно заданной базой
    Когда TODO
