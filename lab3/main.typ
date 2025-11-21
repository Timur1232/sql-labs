#import "uni_2.typ": *
#show: uni_style

#front_page(
  lab_name: [Введение в MongoDB: работа с коллекциями и документами],
  lab_number: 3,
  subject: БД,
)

= Цель

Ознакомиться с основами работы в MongoDB; научиться создавать, изменять и удалять
коллекции и документы; научиться выполнять операции поиска и фильтрации данных.

= Постановка задания

\1. Ознакомиться с теоретическим материалом в пункте 3.2. Создать тестовую БД по примеру из
методических указаний, результат выполнения продемонстрировать преподавателю.

\2. Согласно варианту, создать коллекцию документов. Добавить в коллекцию не менее 10
документов.

\3. Вывести список документов в коллекции со всеми атрибутами, выполнив запрос к базе
данных.

\4. Вывести основные атрибуты части документов коллекции, удовлетворяющих некоторому
условию (использовать операторы выбора, фильтрацию по отсутствующим свойствам, поиск по
множествам критериев). Запросы должны быть сформулированы на естественном языке. Количество
запросов – не менее 10.

\5. Обновить документы, используя методы из пункта 3.2.4.

\6. Удалить документы, используя методы из пункта 3.2.4.

\7. Сформировать отчет.

= Вариант

Вариант 3. Каршеринг (Аренда автомобилей):
Система аренды автомобилей с данными о машинах, пользователях, времени аренды,
стоимости и истории поездок.

= Ход работы

== Создание БД

Код создания базы данных представлен в #link(<attach>)[Приложении А].

Создана бд из трех коллекций. На @print1 - @print3 представлен вывод первых элементов из каждой коллекции.

#v(1.5em)
#figure_image("images/cars.png", caption: [Коллекция автомобилей], width: 35%) <print1>
#v(1.5em)
#figure_image("images/users.png", caption: [Коллекция пользователей], width: 50%) <print2>
#v(1.5em)
#figure_image("images/bookings.png", caption: [Коллекция брони], width: 50%) <print3>

== Запросы вывода

1. Найти все доступные автомобили премиум-класса

#listing_code(caption: [Код запроса 1])[`
db.cars.find({
    class: "premium",
    status: "available"
}, {
    brand: 1,
    model: 1,
    gov_number: 1,
    status: 1,
});
`]

#v(1.5em)
#figure_image("images/1.png", caption: [Запрос №1], width: 35%)
#v(1.5em)

2. Найти пользователей старше 19 лет

#listing_code(caption: [Код запроса 2])[`
db.users.find(
    { age: { $gte: 20 } },
    {
        first_name: 1,
        surname: 1,
        cars_rented: 1,
        age: 1,
    }
).sort({ cars_rented: -1 });
`]

#v(1.5em)
#figure_image("images/2.png", caption: [Запрос №2], width: 30%)
#v(1.5em)

3. Найти автомобили черного или белого цвета

#listing_code(caption: [Код запроса 3])[`
db.cars.find({
    color: { $in: ["black", "white"] },
}, {
    brand: 1,
    model: 1,
    gov_number: 1,
    color: 1,
});
`]

#v(1.5em)
#figure_image("images/3.png", caption: [Запрос №3], width: 30%)
#v(1.5em)

4. Найти бронь между 16 и 18 ноября

#listing_code(caption: [Код запроса 4])[`
db.bookings.find({
    booking_date: {
        $gte: ISODate("2025-11-16T00:00:00Z"),
        $lte: ISODate("2025-11-18T23:59:59Z")
    },
}, {
    booking_date: 1,
    cost: 1,
    status: 1,
});
`]

#v(1.5em)
#figure_image("images/4.png", caption: [Запрос №4], width: 50%)
#v(1.5em)

5. Найти бронь с ценой от 2000 до 4000

#listing_code(caption: [Код запроса 5])[`
db.bookings.find({
    cost: { $gte: 2000, $lte: 4000 }
}, {
    booking_date: 1,
    cost: 1,
});
`]

#v(1.5em)
#figure_image("images/5.png", caption: [Запрос №5], width: 60%)
#v(1.5em)

6. Найти пользователей без почты или без телефона

#listing_code(caption: [Код запроса 6])[`
db.users.find({
    $or: [
        { email: null },
        { phone: null }
    ]
}, {
    first_name: 1,
    surname: 1,
    cars_rented: 1,
});
`]

#v(1.5em)
#figure_image("images/6.png", caption: [Запрос №6], width: 70%)
#v(1.5em)

7. Найти активные и завершенные брони на 20 ноября

#listing_code(caption: [Код запроса 7])[`
db.bookings.find({
    status: { $in: ["active", "completed"] },
    booking_date: { $gte: ISODate("2025-11-20T00:00:00Z") }
}, {
    booking_date: 1,
    cost: 1,
    status: 1,
});
`]

#v(1.5em)
#figure_image("images/7.png", caption: [Запрос №7], width: 50%)
#v(1.5em)

8. Найти либо toyota годом сборки начиная с 2022, либо любой премиальный автомобиль 2023 года

#listing_code(caption: [Код запроса 8])[`
db.cars.find({
    $or: [
        { brand: "Toyota", year: { $gte: 2022 } },
        { class: "premium", year: 2020 }
    ]
}, {
    brand: 1,
    class: 1,
    year: 1,
});
`]

#v(1.5em)
#figure_image("images/8.png", caption: [Запрос №8], width: 90%)
#v(1.5em)

9. Найти брони, по которым еще ни разу не совершали поездки

#listing_code(caption: [Код запроса 9])[`
db.bookings.find({
    trips_history: { $size: 0 }
}, {
    booking_date: 1,
    user_id: 1,
    cost: 1,
});
`]

#v(1.5em)
#figure_image("images/9.png", caption: [Запрос №9], width: 90%)
#v(1.5em)

10. Найти недоступные автомобили

#listing_code(caption: [Код запроса 10])[`
db.cars.find({
    status: { $ne: "available" }
}, {
    brand: 1,
    model: 1,
    gov_number: 1,
});
`]

#v(1.5em)
#figure_image("images/10.png", caption: [Запрос №10], width: 80%)

== Обновление данных

На рисунках @u1 - @b1 представлены результаты обновления данных в коллекциях.

1. Обновление для первой записи статуса на "доступный" и установка цены для брэнда "Lada"

#listing_code(caption: [Код обновления 1])[`
db.cars.updateOne(
    {
        brand: "Lada",
    },
    {
        $set: {
            status: "available",
            price_per_day: 1300,
        },
    },
);
`]

#v(1.5em)
#figure_image("images/u1.png", caption: [Коллекции до и после обновления 1], width: 70%) <u1>
#v(1.5em)

2. Обновление цены на 1700 всех автомобилей с классом "эконом" и статусом "достапный"

#listing_code(caption: [Код обновления 2])[`
db.cars.updateMany(
    {
        class: "economy",
        status: "available",
    },
    {
        $set: {
            price_per_day: 1700,
        },
    },
);
`]

#v(1.5em)
#figure_image("images/u2.png", caption: [Коллекции до и после обновления 2], width: 90%) <u2>
#v(1.5em)

3. Замена документа с ID равным 3

#listing_code(caption: [Код обновления 3])[`
db.users.replaceOne(
    {
        _id: 3,
    },
    {
        _id: 3,
        first_name: "Алексей",
        surname: "Козлов",
        cars_rented: 2,
        age: 36,
        email: "alex.kozlov.new@mail.ru",
        phone: "+79169874564",
        license_number: "77EF789457",
    },
);
`]

#v(1.5em)
#figure_image("images/u3.png", caption: [Коллекции до и после обновления 3], width: 40%) <u3>
#v(1.5em)

4. Удаление автомобиля с номером "B456DE777"

#listing_code(caption: [Код удаления 1])[`
db.cars.deleteOne(
    {
        gov_number: "B456DE777",
    }
);
`]

#v(1.5em)
#figure_image("images/d1.png", caption: [Коллекции до и после удаления 1], width: 70%) <d1>
#v(1.5em)

5. Удаление всех оконченных и отмененных броней \
\

#listing_code(caption: [Код удаления 2])[`
db.bookings.deleteMany(
    {
        status: { $in: ["completed", "canceled"] }
    }
);
`]

#v(1.5em)
#figure_image("images/d2.png", caption: [Коллекции до и после удаления 2], width: 60%) <d2>
#v(1.5em)

6. Одновременное увеличение класса и цены для доступных марок BMW, Mercedes и Audi, и удаление всех автомобилей, произведенных до 2020 года

#listing_code(caption: [Код множественного изменения])[`
db.cars.bulkWrite([
    {
        updateMany: {
            filter: {
                brand: { $in: ["BMW", "Mercedes", "Audi"] },
                status: "available"
            },
            update: {
                $set: { class: "premium" },
                $inc: { price_per_day: 500 }
            }
        }
    },
    {
        deleteMany: {
            filter: {
                year: { $lt: 2020 },
                status: "maintenance"
            }
        }
    }
]);
`]

#v(1.5em)
#figure_image("images/b1.png", caption: [Коллекции до и после обновления 3], width: 90%) <b1>
#v(1.5em)

= Вывод

В ходе лабораторной работы освоены основы работы с MongoDB. Получены навыки
создания базы данных, коллекций и документов, выполнение операций поиска,
фильтрации, обновления и удаления данных. На примере системы каршеринга
реализованы запросы для выборки документов по заданным условиям и запросы
обновления и удаления данных.

#pagebreak()

#attachments(
  "/init.js",
) <attach>
