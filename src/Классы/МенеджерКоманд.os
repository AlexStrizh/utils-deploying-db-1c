#Использовать configor

Перем Лог; // Объект, для логирования

// Перем УдалятьВременныеФайлы; // Булево, признак удаления временных файлов

Перем АвторизацияНаКластереСерверов; // Структура ключи <АдминистраторКластера>, <ПарольАдминистратораКластера>

// ///////////////////////////////////////////////////////////////////////////////////////////////
// // ПРОГРАММНЫЙ ИНТЕРФЕЙС

Перем ТекущаяВерсияПлатформы Экспорт; // Строка, используемая версия 1С.Предприятие

Перем СтрокаПодключенияКБазе;
Перем КоличествоПопытокОтключения;
Перем БлокироватьСеансы;
Перем КодРазрешенияЗапуска;
Перем СообщениеБлокировки;
Перем ВремяСтартаБлокировки;
Перем ФильтрСеансов;

Перем ПутьКФайлуНастроек;

Перем Параметры;

#Область Публичное_API
// Устанавливает параметры авторизации на кластере серверов 1С
//
// Параметры:
//   Пользователь - Строка - пользователь кластера серверов 1С
//   Пароль - Строка - пароль пользователя кластера серверов 1С
//
// Возвращаемое значение:
//   Объект.МенеджерКоманд - ссылка на текущий объект класса <МенеджерКоманд>
//
Функция АвторизацияНаКластереСерверов(Знач Пользователь, Знач Пароль) Экспорт

	Лог.Отладка("Установлена авторизация на кластере серверов 1С: пользователь <%1>, пароль <%2>", Пользователь, Пароль);
	АвторизацияНаКластереСерверов.Вставить("АдминистраторКластера" , Пользователь);
	АвторизацияНаКластереСерверов.Вставить("ПарольАдминистратораКластера", Пароль);

	Возврат ЭтотОбъект;

КонецФункции

// Возвращает значение параметра со значением администратора кластера
//
// Возвращаемое значение:
//   Строка - значение параметра <АвторизацияНаКластереСерверов.АдминистратораКластера>
//
Функция ПолучитьАдминистратораКластера() Экспорт
	Возврат АвторизацияНаКластереСерверов.АдминистраторКластера;
КонецФункции

// Возвращает значение параметра со значением пароля администратора кластера
//
// Возвращаемое значение:
//   Строка - значение параметра <АвторизацияНаКластереСерверов.ПарольАдминистратораКластера>
//
Функция ПолучитьПарольАдминистратораКластера() Экспорт
	Возврат АвторизацияНаКластереСерверов.ПарольАдминистратораКластера;
КонецФункции

// Устанавливает уровень вывода логов
//
// Параметры:
//   НовыйУровеньЛога - Строка - уровень вывода лога
//
// Возвращаемое значение:
//   Объект.МенеджерКоманд - ссылка на текущий объект класса <МенеджерКоманд>
//
Функция УровеньЛога(Знач НовыйУровеньЛога) Экспорт

	Лог.УстановитьУровень(НовыйУровеньЛога);
	Возврат ЭтотОбъект;

КонецФункции

// Устанавливает версию платформы 1С
//
// Параметры:
//   НоваяВерсияПлатформы - Строка - версия платформы 1С используемой для работы
//
// Возвращаемое значение:
//   Объект.МенеджерКоманд - ссылка на текущий объект класса <МенеджерКоманд>
//
Функция ВерсияПлатформы(Знач НоваяВерсияПлатформы) Экспорт

	ТекущаяВерсияПлатформы = НоваяВерсияПлатформы;
	Возврат ЭтотОбъект;

КонецФункции

// Устанавливает путь к файлу настроек
//
// Параметры:
//   НовыйПутьКФайлуНастроек - Строка - путь к файлу настроек
//
// Возвращаемое значение:
//   Объект.МенеджерКоманд - ссылка на текущий объект класса <МенеджерКоманд>
//
Функция УстановитьНастройки(НовыйПутьКФайлуНастроек) Экспорт
	ПутьКФайлуНастроек = НовыйПутьКФайлуНастроек;
	Возврат ЭтотОбъект;
КонецФункции

// Устанавливает количество попыток отключения пользователей
//
// Параметры:
//   КоличествоПопыток - Число - количество попыток отключения пользователей
//
// Возвращаемое значение:
//   Объект.МенеджерКоманд - ссылка на текущий объект класса <МенеджерКоманд>
//
Функция КоличествоПопытокОтключения(Знач КоличествоПопыток) Экспорт
	КоличествоПопытокОтключения = КоличествоПопыток;
	Возврат ЭтотОбъект;
КонецФункции

// Устанавливает строку подключения к информационной базе
//
// Параметры:
//   СтрокаПодключения - Строка - строка подлючения
//
// Возвращаемое значение:
//   Объект.МенеджерКоманд - ссылка на текущий объект класса <МенеджерКоманд>
//
Функция СтрокаПодключения(Знач СтрокаПодключения) Экспорт
	СтрокаПодключенияКБазе = СтрокаПодключения;
	Возврат ЭтотОбъект;
КонецФункции

// Возвращает значение параметра со значением строки подключения к информационной базе
//
// Возвращаемое значение:
//   Строка - значение параметра <СтрокаПодключенияКБазе>
//
Функция ПолучитьСтрокуПодключенияКБазе() Экспорт
	Возврат СтрокаПодключенияКБазе;
КонецФункции

// Устанавливает блокировку сеансов к информационной базе
//
// Параметры:
//   Блокировать - Булево - блокировать/не блокировать (Истина/Ложь)
//
// Возвращаемое значение:
//   Объект.МенеджерКоманд - ссылка на текущий объект класса <МенеджерКоманд>
//
Функция БлокироватьСеансы(Знач Блокировать) Экспорт
	БлокироватьСеансы = Блокировать;
	Возврат ЭтотОбъект;
КонецФункции

// Возвращает значение параметра блокировки информационной базы
//
// Возвращаемое значение:
//   Булево - значение параметра <БлокироватьСеансы>
//
Функция ПолучитьИнформациюОБлокировкеСеансов() Экспорт
	Возврат БлокироватьСеансы;
КонецФункции

// Устанавливает код разрешения подключения к информационной базе
//
// Параметры:
//   КодРазрешения - Строка - код разрешения подключения к информационной базе
//
// Возвращаемое значение:
//   Объект.МенеджерКоманд - ссылка на текущий объект класса <МенеджерКоманд>
//
Функция УстановитьКодРазрешенияЗапуска(Знач КодРазрешения) Экспорт
	КодРазрешенияЗапуска = КодРазрешения;
	Возврат ЭтотОбъект;
КонецФункции

// Возвращает значение кода разрешения подключения к информационной базе
//
// Возвращаемое значение:
//   Строка - значение параметра <КодРазрешенияЗапуска>
//
Функция ПолучитьКодРазрешенияЗапуска() Экспорт
	Возврат КодРазрешенияЗапуска;
КонецФункции

// Устанавливает сообщение блокировки подключения к информационной базе
//
// Параметры:
//   Сообщение - Строка - код разрешения подключения к информационной базе
//
// Возвращаемое значение:
//   Объект.МенеджерКоманд - ссылка на текущий объект класса <МенеджерКоманд>
//
Функция УстановитьСообщениеБлокировки(Знач Сообщение) Экспорт
	СообщениеБлокировки = Сообщение;
	Возврат ЭтотОбъект;
КонецФункции

// Возвращает значение сообщения блокировки информационной базы
//
// Возвращаемое значение:
//   Строка - значение параметра <СообщениеБлокировки>
//
Функция ПолучитьСообщениеБлокировки() Экспорт
	Возврат СообщениеБлокировки;
КонецФункции

// Устанавливает время блокировки подключения к информационной базе
//
// Параметры:
//   Сообщение - Строка - время старта блокировки подключения информационной базы,
//							формат '2040-12-31T23:59:59'
//
// Возвращаемое значение:
//   Объект.МенеджерКоманд - ссылка на текущий объект класса <МенеджерКоманд>
//
Функция УстановитьВремяСтартаБлокировки(Знач ВремяСтарта) Экспорт
	ВремяСтартаБлокировки = ВремяСтарта;
	Возврат ЭтотОбъект;
КонецФункции

// Возвращает значение времени начала блокировки информационной базы
//
// Возвращаемое значение:
//   Строка - значение параметра <ВремяСтартаБлокировки>
//
Функция ПолучитьВремяСтартаБлокировки() Экспорт
	Возврат ВремяСтартаБлокировки;
КонецФункции

// Устанавливает фильтр поиска сеансов подключений к информационной базе
//
// Параметры:
//   Сообщение - Строка - фильтр поиска сеансов
//
// Возвращаемое значение:
//   Объект.МенеджерКоманд - ссылка на текущий объект класса <МенеджерКоманд>
//
Функция УстановитьФильтрСеансов(Знач Фильтр) Экспорт
	ФильтрСеансов = Фильтр;
	Возврат ЭтотОбъект;
КонецФункции

// Возвращает значение фильтра поиска сеансов подключений информационной базы
//
// Возвращаемое значение:
//   Строка - значение параметра <ФильтрСеансов>
//
Функция ПолучитьФильтрСеансов() Экспорт
	Возврат ФильтрСеансов;
КонецФункции

Функция УстановитьАдаптерПараметров83()

	МассивПараметров = Новый Массив;

	МассивПараметров.Добавить("session");
	МассивПараметров.Добавить("kill");
	МассивПараметров.Добавить("--v8version");
	МассивПараметров.Добавить(ТекущаяВерсияПлатформы);

	Если НЕ ПустаяСтрока(ПутьКФайлуНастроек) Тогда
		МассивПараметров.Добавить("--settings");
		МассивПараметров.Добавить(ПутьКФайлуНастроек);
	КонецЕсли;

	ПараметрыПодключения = РазложитьСтрокуПодлючения(СтрокаПодключенияКБазе);
	Если ПараметрыПодключения.Количество() <> 2  Тогда
		ВызватьИсключение "Доступен только клиент-серверный режим.";
	КонецЕсли;

	МассивПараметров.Добавить("--ras");
	МассивПараметров.Добавить(ПараметрыПодключения[0]);

	МассивПараметров.Добавить("--db");
	МассивПараметров.Добавить(ПараметрыПодключения[1]);

	МассивПараметров.Добавить("--try");
	МассивПараметров.Добавить(КоличествоПопытокОтключения);

	Если НЕ БлокироватьСеансы Тогда
		МассивПараметров.Добавить("--with-nolock");
	Иначе
		Если ЗначениеЗаполнено(КодРазрешенияЗапуска) Тогда
			МассивПараметров.Добавить("--uccode");
			МассивПараметров.Добавить(КодРазрешенияЗапуска);

			Если ЗначениеЗаполнено(СообщениеБлокировки) Тогда
				МассивПараметров.Добавить("--lockmessage");
				МассивПараметров.Добавить(СообщениеБлокировки);
			КонецЕсли;

			Если ЗначениеЗаполнено(ВремяСтартаБлокировки) Тогда
				МассивПараметров.Добавить("--lockstart");
				МассивПараметров.Добавить(ВремяСтартаБлокировки);
			КонецЕсли;
		КонецЕсли;
	КонецЕсли;

	Если ЗначениеЗаполнено(ФильтрСеансов) Тогда
		МассивПараметров.Добавить("--filter");
		МассивПараметров.Добавить(ФильтрСеансов);
	КонецЕсли;

	ПараметрыЗапуска = Новый Структура;
	ПараметрыЗапуска.Вставить("АргументыКоманднойСтроки", МассивПараметров);

	Возврат ПараметрыЗапуска;

КонецФункции

Процедура ВыполнитьОтключениеПользователей() Экспорт

	Если ПолучитьВариантЗапускаОтключения() = "8.3" Тогда

		Попытка
			ПараметрыОкружения = УстановитьАдаптерПараметров83();
		Исключение
			ИнформацияОбОшибке = ИнформацияОбОшибке();
			ВызватьИсключение "Ошибка при попытке получения параметров окружения. " + ИнформацияОбОшибке.Описание;
		КонецПопытки;

		Попытка
			vrunner = ЗагрузитьСценарий(ПолучитьПутьКVrunner(), ПараметрыОкружения);
		Исключение
			ИнформацияОбОшибке = ИнформацияОбОшибке();
			ВызватьИсключение "Ошибка при загрузке сценария vrunner. " + ИнформацияОбОшибке.Описание;
		КонецПопытки;
		
	Иначе

		//C:\Users\a.strizhachuk\github\utils-deploying-db-1c\src\utils.os

	КонецЕсли;

КонецПроцедуры

Процедура ПрочитатьФайлНастроек() Экспорт

	МенеджерПараметров = Новый МенеджерПараметров();
	МенеджерПараметров.УстановитьФайлПараметров(ПутьКФайлуНастроек);
	МенеджерПараметров.ИспользоватьПровайдерJSON();
	МенеджерПараметров.ИспользоватьПровайдерYAML();
	МенеджерПараметров.КонструкторПараметров(ЭтотОбъект);
	
	Лог.Отладка("Чтение файла настроек начато");
	МенеджерПараметров.Прочитать();
	Лог.Отладка("Чтение файла настроек завершено");

КонецПроцедуры

#КонецОбласти

#Область Интерфейс_конструктора_параметров

Функция Параметры() Экспорт
	Возврат Параметры;
КонецФункции

Процедура УстановитьПараметры(Знач ВходящиеПараметры) Экспорт
	Параметры = ВходящиеПараметры;
КонецПроцедуры

Процедура ОписаниеПараметров(Знач Конструктор) Экспорт

	НастройкиПоУмолчанию = Конструктор.НовыеПараметры("Параметры");

	НастройкиПоУмолчанию = Конструктор.НовыеПараметры("Параметры")
						.ПолеСтрока("СтрокаПодключенияКБазе ibconnection --ibconnection", СтрокаПодключенияКБазе)
						.ПолеСтрока("АдминистраторКластера db-user --db-user", АвторизацияНаКластереСерверов.АдминистраторКластера)
						.ПолеСтрока("ПарольАдминистратораКластера db-pwd --db-pwd", АвторизацияНаКластереСерверов.ПарольАдминистратораКластера)
						.ПолеЧисло("КоличествоПопыток try --try", КоличествоПопытокОтключения)
						.ПолеБулево("БлокироватьСеансы lock --lock", БлокироватьСеансы)
						.ПолеСтрока("КодРазрешенияЗапуска uccode --uccode", КодРазрешенияЗапуска)
						.ПолеСтрока("СообщениеБлокировки lockmessage --lockmessage", СообщениеБлокировки)
						.ПолеСтрока("ВремяСтартаБлокировки lockstart --lockstart", ВремяСтартаБлокировки)
						;
	
	Конструктор.ПолеОбъект("НастройкиПоУмолчанию default", НастройкиПоУмолчанию);

КонецПроцедуры

#КонецОбласти

#Область Служебные_процедуры_и_функции

// После перехода на 8.3 поддержку 8.2 убрать в топку
Функция ПолучитьВариантЗапускаОтключения()

	Если ТекущаяВерсияПлатформы = Неопределено Тогда
		Возврат "8.3";
	КонецЕсли;

	Возврат Лев(ТекущаяВерсияПлатформы, 3);

КонецФункции

Функция УбратьКавычкиВокругПути(Знач Путь) Экспорт
	//NOTICE: https://github.com/xDrivenDevelopment/precommit1c 
	//Apache 2.0 
	ОбработанныйПуть = Путь;

	Если Лев(ОбработанныйПуть, 1) = """" Тогда
		ОбработанныйПуть = Прав(ОбработанныйПуть, СтрДлина(ОбработанныйПуть) - 1);
	КонецЕсли;
	Если Прав(ОбработанныйПуть, 1) = """" Тогда
		ОбработанныйПуть = Лев(ОбработанныйПуть, СтрДлина(ОбработанныйПуть) - 1);
	КонецЕсли;
	
	Возврат ОбработанныйПуть;
	
КонецФункции

Функция РазложитьСтрокуПодлючения(Знач СтрокаПодключения)
	
	МассивПодключения = Новый Массив;

	Если Врег(Лев(СтрокаПодключения, 2)) = "/F" Тогда
		ВызватьИсключение "Доступен только клиент-серверный режим.";
	ИначеЕсли Врег(Лев(СтрокаПодключения, 2)) = "/S" Тогда
		//Connect=Srvr="serverssl.service.th.consul";Ref="ssl";
		РезультатПромежуточный = УбратьКавычкиВокругПути(
				УбратьКавычкиВокругПути(Сред(СтрокаПодключения,3))
				);
		Разделитель = ?(Найти(РезультатПромежуточный, "/") > 0, "/", "\");

		МассивПодключения =	СтроковыеФункции.РазложитьСтрокуВМассивПодстрок(РезультатПромежуточный, Разделитель);
	КонецЕсли;

	Возврат МассивПодключения;

КонецФункции

Функция ПолучитьПутьКVrunner()
	КаталогПрограммы = КаталогПрограммы();
	КаталогБиблиотек = СтрЗаменить(КаталогПрограммы, "bin", "lib");
	Лог.Отладка("Путь к каталогу библиотек OneScript: %1", КаталогБиблиотек);

	ПутьКVrunner = ОбъединитьПути(КаталогБиблиотек, "vanessa-runner\src\main.os");

	Если НЕ (Новый Файл(ПутьКVrunner)).Существует() Тогда
		ВызватьИсключение "Не найден vrunner.";
	КонецЕсли;

	Возврат ПутьКVrunner;
КонецФункции

#КонецОбласти

Процедура ПриСозданииОбъекта()

	АвторизацияНаКластереСерверов = Новый Структура;
	Лог = ПараметрыПриложения.Лог();

КонецПроцедуры