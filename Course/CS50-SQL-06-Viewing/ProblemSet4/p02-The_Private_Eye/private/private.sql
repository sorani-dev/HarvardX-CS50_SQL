CREATE TABLE IF NOT EXISTS "cipher"(
    "sentence_number" TEXT,
    "character_number" TEXT,
    "message_length" TEXT
);
INSERT INTO cipher
VALUES('14', '98', '4');
INSERT INTO cipher
VALUES('114', '3', '5');
INSERT INTO cipher
VALUES('618', '72', '9');
INSERT INTO cipher
VALUES('630', '7', '3');
INSERT INTO cipher
VALUES('932', '12', '5');
INSERT INTO cipher
VALUES('2230', '50', '7');
INSERT INTO cipher
VALUES('2346', '44', '10');
INSERT INTO cipher
VALUES('3041', '14', '5');
-- Creating message VIEW
CREATE VIEW message AS
SELECT substr(
        sentence,
        cipher.character_number,
        cipher.message_length
    ) as "phrase"
FROM sentences
    INNER JOIN cipher ON cipher.sentence_number = sentences.id;
