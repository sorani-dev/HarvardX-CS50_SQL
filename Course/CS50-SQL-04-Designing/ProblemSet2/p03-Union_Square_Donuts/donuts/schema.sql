CREATE TABLE IF NOT EXISTS ingredients (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "price" NUMERIC NOT NULL CHECK("price" >= 0),
    PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS donuts (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "gluten-free" INTEGER CHECK("gluten-free" IN (0, 1)),
    "price" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS contains (
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id")
);
CREATE TABLE customers (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    PRIMARY KEY("id")
);
CREATE TABLE orders (
    "id" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);
CREATE TABLE requests (
    "customer_id" INTEGER,
    "order_id" INTEGER,
    FOREIGN KEY("customer_id") REFERENCES "customers"("id"),
    FOREIGN KEY("order_id") REFERENCES "orders"("id")
);
