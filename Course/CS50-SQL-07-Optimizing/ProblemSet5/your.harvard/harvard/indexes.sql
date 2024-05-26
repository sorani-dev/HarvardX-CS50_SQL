EXPLAIN QUERY PLAN
SELECT "courses"."title", "courses"."semester" 
FROM "enrollments"
JOIN "courses" ON "enrollments"."course_id" = "courses"."id"
JOIN "students" ON "enrollments"."student_id" = "students"."id"
WHERE "students"."id" = 3;
SELECT "courses"."title", "courses"."semester" 
FROM "enrollments"
JOIN "courses" ON "enrollments"."course_id" = "courses"."id"
JOIN "students" ON "enrollments"."student_id" = "students"."id"
WHERE "students"."id" = 3;

SELECT "requirements"."name"
FROM "requirements"
WHERE "requirements"."id" = (
    SELECT "requirement_id"
    FROM "satisfies"
    WHERE "course_id" = (
        SELECT "id"
        FROM "courses"
        WHERE "title" = 'Advanced Databases'
        AND "semester" = 'Fall 2023'
    )
);


CREATE INDEX "student_name" ON "students" ("name");

-- CREATE INDEX "course_title_semester" ON "courses"("title", "semester");
CREATE INDEX "student_course" ON "enrollments" ("student_id", "course_id");

-- CREATE INDEX "student_department" ON "students"("department");
-- CREATE INDEX "course_department" ON "courses"("department");
-- CREATE INDEX "requirents_name" ON "requirements"("name");
-- CREATE INDEX "course_fields" ON "courses"("department", "number", "title");
-- me now
CREATE INDEX "satisfies_requirements_course" ON "satisfies" ("requirement_id", "course_id");

CREATE INDEX "requirents_name" ON "requirements" ("name");

CREATE INDEX "course_title" ON "courses" ("title");
