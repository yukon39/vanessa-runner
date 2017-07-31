///////////////////////////////////////////////////////////////////////////////////////////////////
//
// Обновление конфигурации базы данных в режиме Конфигуратора
// 
// TODO добавить фичи для проверки команды
//
// Служебный модуль с набором методов работы с командами приложения
//
// Структура модуля реализована в соответствии с рекомендациями 
// oscript-app-template (C) EvilBeaver
//
///////////////////////////////////////////////////////////////////////////////////////////////////

#Использовать v8runner

///////////////////////////////////////////////////////////////////////////////////////////////////
// Прикладной интерфейс

Процедура ЗарегистрироватьКоманду(Знач ИмяКоманды, Знач Парсер) Экспорт

	ТекстОписания = 
		"     Обновление конфигурации базы данных в режиме Конфигуратора
		|     ";

	ОписаниеКоманды = Парсер.ОписаниеКоманды(ПараметрыСистемы.ВозможныеКоманды().ОбновитьКонфигурациюБазыДанных, 
		ТекстОписания);
	Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, "--uccode", "Ключ разрешения запуска");
	Парсер.ДобавитьКоманду(ОписаниеКоманды);
	
КонецПроцедуры // ЗарегистрироватьКоманду

// Выполняет логику команды
// 
// Параметры:
//   ПараметрыКоманды - Соответствие - Соответствие ключей командной строки и их значений
//   ДополнительныеПараметры (необязательно) - Соответствие - дополнительные параметры
//
Функция ВыполнитьКоманду(Знач ПараметрыКоманды, Знач ДополнительныеПараметры = Неопределено) Экспорт

	МенеджерКонфигуратора = Новый МенеджерКонфигуратора;

	СтрокаПодключения = ?(ПараметрыКоманды["--usecache"] = "1", 
				ОбщиеМетоды.ПреобразоватьСтрокуПодключения(ПараметрыКоманды["--ibname"]),
				ПараметрыКоманды["--ibname"]);


	МенеджерКонфигуратора.ОбновитьКонфигурациюБазыДанных(
		СтрокаПодключения, 
		ПараметрыКоманды["--db-user"], ПараметрыКоманды["--db-pwd"],
		ПараметрыКоманды["--uccode"], ПараметрыКоманды["--v8version"]);

	Возврат МенеджерКомандПриложения.РезультатыКоманд().Успех;
КонецФункции // ВыполнитьКоманду
