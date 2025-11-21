// найти все доступные автомобили премиум-класса
print('----------------------[запрос 1]----------------------')
print(db.cars.find({
    class: "premium",
    status: "available"
}, {
    brand: 1,
    model: 1,
    gov_number: 1,
    status: 1,
}));

// найти пользователей старше 19 лет
print('----------------------[запрос 2]----------------------')
print(db.users.find(
    { age: { $gte: 20 } },
    {
        first_name: 1,
        surname: 1,
        cars_rented: 1,
        age: 1,
    }
).sort({ cars_rented: -1 }));

// найти автомобили черного или белого цвета
print('----------------------[запрос 3]----------------------')
print(db.cars.find({
    color: { $in: ["black", "white"] },
}, {
    brand: 1,
    model: 1,
    gov_number: 1,
    color: 1,
}));

// найти бронь между 16 и 18 ноября
print('----------------------[запрос 4]----------------------')
print(db.bookings.find({
    booking_date: {
        $gte: ISODate("2025-11-16T00:00:00Z"),
        $lte: ISODate("2025-11-18T23:59:59Z")
    },
}, {
    booking_date: 1,
    cost: 1,
    status: 1,
}));

// найти бронь с ценой от 2000 до 4000
print('----------------------[запрос 5]----------------------')
print(db.bookings.find({
    cost: { $gte: 2000, $lte: 4000 }
}, {
    booking_date: 1,
    cost: 1,
}));

// найти пользователей без почты или без телефона
print('----------------------[запрос 6]----------------------')
print(db.users.find({
    $or: [
        { email: null },
        { phone: null }
    ]
}, {
    first_name: 1,
    surname: 1,
    cars_rented: 1,
}));

// найти активные и завершенные брони на 20 ноября
print('----------------------[запрос 7]----------------------')
print(db.bookings.find({
    status: { $in: ["active", "completed"] },
    booking_date: { $gte: ISODate("2025-11-20T00:00:00Z") }
}, {
    booking_date: 1,
    cost: 1,
    status: 1,
}));

// найти либо toyota годом сборки начиная с 2022, либо любой премиальный автомобиль 2023 года
print('----------------------[запрос 8]----------------------')
print(db.cars.find({
    $or: [
        { brand: "Toyota", year: { $gte: 2022 } },
        { class: "premium", year: 2020 }
    ]
}, {
    brand: 1,
    class: 1,
    year: 1,
}));

// найти брони, по которым еще ни разу не совершали поездки
print('----------------------[запрос 9]----------------------')
print(db.bookings.find({
    trips_history: { $size: 0 }
}, {
    booking_date: 1,
    user_id: 1,
    cost: 1,
}));

// найти недоступные автомобили
print('----------------------[запрос 10]----------------------')
print(db.cars.find({
    status: { $ne: "available" }
}, {
    brand: 1,
    model: 1,
    gov_number: 1,
}));
