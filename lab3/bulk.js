print('------------[до]------------');
print(db.cars.find({
    $or: [
        {
            brand: { $in: ["BMW", "Mercedes", "Audi"] },
            status: "available",
        },
        {
            year: { $lt: 2020 },
            status: "maintenance"
        }
    ]
}, {
    brand: 1,
    status: 1,
}));
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
print('------------[после]------------');
print(db.cars.find({
    $or: [
        {
            brand: { $in: ["BMW", "Mercedes", "Audi"] },
            status: "available",
        },
        {
            year: { $lt: 2020 },
            status: "maintenance"
        }
    ]
}, {
    brand: 1,
    status: 1,
}));
