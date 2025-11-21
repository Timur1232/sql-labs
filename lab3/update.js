print('------------[до]------------');
print(db.cars.find({brand: "Lada"}, {
    status: 1,
    price_per_day: 1,
}));
print(db.cars.updateOne(
    {
        brand: "Lada",
    },
    {
        $set: {
            status: "available",
            price_per_day: 1300,
        },
    },
));
print('------------[после]------------');
print(db.cars.find({brand: "Lada"}, {
    status: 1,
    price_per_day: 1,
}));

print('------------[до]------------');
print(db.cars.find(
    {
        class: "economy",
        status: "available",
    },
    {
        price_per_day: 1,
    }
));
print(db.cars.updateMany(
    {
        class: "economy",
        status: "available",
    },
    {
        $set: {
            price_per_day: 1700,
        },
    },
));
print('------------[после]------------');
print(db.cars.find(
    {
        class: "economy",
        status: "available",
    },
    {
        price_per_day: 1,
    }
));

print('------------[до]------------');
print(db.users.find(
    { _id: 3 },
));
print(db.users.replaceOne(
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
));
print('------------[после]------------');
print(db.users.find(
    { _id: 3 },
));
