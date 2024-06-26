﻿
// +++ Нет описания областей

Функция ТекстHTML() Экспорт
	
	УстановитьПривилегированныйРежим(Истина);
	
	// +++ Так как значение функции зависит от данных информационной базы (константы), то функция может возвращать разные значения.
	// Но ПовтИсп не будет этого делать и если у нас константа сначала была незаполнена, а потом заполнена - то модуль все равно вернет неопределено.

	АдресПубликации = Константы.ФНФ_АдресПубликацииБазы.Получить();
	// +++ Лучше выключить привилегированный режим после небезопасной операции.
	
	Если ПустаяСтрока(АдресПубликации) Тогда
		ВызватьИсключение "Не заполнен адрес публикации базы!";
	КонецЕсли;
	
	// +++ Не стоит экономить буквы на переменных
	Позиц = СтрНайти(АдресПубликации, "/", НаправлениеПоиска.СКонца);
	
	// +++ Видимо АдресПубликации должен быть определенного формата - стоит его описать, чтобы разработчик мог быстро поправить.
	АдресСервера = Лев(АдресПубликации, Позиц - 1);
	
	Текст = ПолучитьОбщийМакет("ФНФ_ТекстHTML").ПолучитьТекст();
	Текст = СтрЗаменить(Текст, "АдресПубликации", АдресПубликации);
	Текст = СтрЗаменить(Текст, "АдресСервера", АдресСервера);
	Возврат Текст;
	
КонецФункции