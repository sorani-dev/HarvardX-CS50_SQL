CREATE TABLE IF NOT EXISTS "sentences" (
    "id" INTEGER,
    "sentence" TEXT NOT NULL,
    PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "cipher"(
"sentence_number" TEXT, "character_number" TEXT, "message_length" TEXT);
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
COMMIT;
