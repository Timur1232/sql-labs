print('------------[до]------------');
print(db.cars.find(
    { gov_number: "B456DE777", },
    { gov_number: 1 }
));
db.cars.deleteOne(
    {
        gov_number: "B456DE777",
    }
);
print('------------[после]------------');
print(db.cars.find(
    { gov_number: "B456DE777", },
    { gov_number: 1 }
));

print('------------[до]------------');
print(db.bookings.find(
    { status: { $in: ["completed", "canceled"] } },
    { status: 1 }
));
db.bookings.deleteMany(
    {
        status: { $in: ["completed", "canceled"] }
    }
);
print('------------[после]------------');
print(db.bookings.find(
    { status: { $in: ["completed", "canceled"] } },
    { status: 1 }
));
