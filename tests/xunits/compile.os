#Использовать asserts
#Использовать tempfiles
#Использовать "utils"
#Использовать "..\.."

#Область ОписаниеПеременных

Перем НакопленныеВременныеФайлы; // фиксация накопленных времнных файлов для сброса

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

&Тест
Процедура ТестДолжен_СобратьКонфигурациюИзИсходниковВТекущуюБазуIbcmd() Экспорт

	// Дано
	Исполнитель = Новый Тест_ИсполнительКоманд("compile");
	Исполнитель.УстановитьКонтекстПустаяИБ();

	КаталогSrc = Исполнитель.ПутьТестовыхДанных("cf");
	Исполнитель.ДобавитьПараметр("--src", КаталогSrc);
	Исполнитель.ДобавитьФлаг("--current");
	Исполнитель.ДобавитьФлаг("--noupdate");
	Исполнитель.ДобавитьФлаг("--ibcmd");

	// Когда
	Исполнитель.ВыполнитьКоманду();

	// Тогда
	Исполнитель.ОжидаемЧтоВыводСодержит("Используется ibcmd");
	Исполнитель.ОжидаемЧтоВыводСодержит("Сборка конфигурации из исходников в текущую ИБ завершена.");
		
КонецПроцедуры

&Тест
Процедура ТестДолжен_СобратьКонфигурациюИзИсходниковIbcmd() Экспорт

	// Дано
	Исполнитель = Новый Тест_ИсполнительКоманд("compile");
	КаталогSrc = Исполнитель.ПутьТестовыхДанных("cf");
	Исполнитель.ДобавитьПараметр("--src", КаталогSrc);
	Исполнитель.ДобавитьПараметр("--out", "1Cv8.cf");
	Исполнитель.ДобавитьФлаг("--noupdate");
	Исполнитель.ДобавитьФлаг("--ibcmd");

	// Когда
	Исполнитель.ВыполнитьКоманду();

	// Тогда
	Исполнитель.ОжидаемЧтоВыводСодержит("Используется ibcmd");
	Исполнитель.ОжидаемЧтоВыводСодержит("Сборка конфигурации из исходников в файл cf завершена.");
	Исполнитель.ОжидаемЧтоФайлСуществует("1Cv8.cf");

КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытий

Процедура ПередЗапускомТеста() Экспорт
	
	НакопленныеВременныеФайлы = ВременныеФайлы.Файлы();
	
КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт
	
	ВременныеФайлы.УдалитьНакопленныеВременныеФайлы(НакопленныеВременныеФайлы);
	
КонецПроцедуры

#КонецОбласти