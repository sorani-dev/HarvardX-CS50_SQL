CREATE TABLE IF NOT EXISTS passenger (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);
CREATE TABLE IF NOT EXISTS airline (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK(
        "concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')
    ),
    PRIMARY KEY ("id")
);
CREATE TABLE IF NOT EXISTS check_ins (
    "id" INTEGER,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY("passenger_id") REFERENCES "passenger"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flight"("id")
);
CREATE TABLE IF NOT EXISTS flight (
    "id" INTEGER,
    "number" INTEGER NOT NULL,
    "airline_id" INTEGER,
    "airport_code_from" TEXT NOT NULL,
    "airport_code_to" TEXT NOT NULL,
    "departure_date" NUMERIC NOT NULL,
    "arrival_date" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airline"("id")
);
