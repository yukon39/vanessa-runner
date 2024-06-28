#Использовать asserts
#Использовать tempfiles
#Использовать "utils"
#Использовать "..\.."

#Область ОписаниеПеременных

Перем НакопленныеВременныеФайлы; // фиксация накопленных времнных файлов для сброса

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

&Тест
Процедура ТестДолжен_ВыгрузитьИнформационноюБазуВФайлIbcmd() Экспорт

	// Дано
	Исполнитель = Новый Тест_ИсполнительКоманд("updatedb");
	КаталогSrc = Исполнитель.ПутьТестовыхДанных("cf");
	Исполнитель.УстановитьКонтекстИБИзФайловКонфигурации(КаталогSrc);
	Исполнитель.ДобавитьФлаг("--ibcmd");
	
	// Когда
	Исполнитель.ВыполнитьКоманду();

	// Тогда
	Исполнитель.ОжидаемЧтоВыводСодержит("Используется ibcmd");
	Исполнитель.ОжидаемЧтоВыводСодержит("Обновление конфигурации базы данных завершено.");
		
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
