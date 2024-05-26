# Happy to Connect

![LinkedIn Logo](linkedin.png)

## Problem to Solve

[LinkedIn](https://about.linkedin.com/) is “the world’s largest professional network” with a mission to “connect the world’s professionals to make them more productive and successful.” Perhaps you have an account? On the platform, users can post their professional experience (i.e., past jobs, education, etc.) and make connections with other people they’ve met, in-person or online.

In a file called `schema.sql` in a folder called `connect`, write a set of SQL statements to design a database LinkedIn could use.

## Specification

Your task at hand is to create a SQLite database for LinkedIn from scratch, as by writing a set of `CREATE TABLE` statements in a `schema.sql` file. The implementation details are up to you, though you should minimally ensure that your database meets the [platform’s specification](https://cs50.harvard.edu/sql/2023/psets/2/connect/#platform) and that it can represent the given [sample data](https://cs50.harvard.edu/sql/2023/psets/2/connect/#sample-data).

### Platform

#### **Users**

The heart of LinkedIn’s platform is its people. Your database should be able to represent the following information about LinkedIn’s users:

- Their first and last name
- Their username
- Their password

Keep in mind that, if a company is following best practices, application passwords are “[hashed](https://en.wikipedia.org/wiki/Hash_function).” No need to worry about hashing passwords here, though.

#### **Schools and Universities**

LinkedIn also allows for official school or university accounts, such as [that for Harvard](https://www.linkedin.com/school/harvard-university/), so alumni (i.e., those who’ve attended) can identify their affiliation. Ensure that LinkedIn’s database can store the following information about each school:

- The name of the school
- The type of school (e.g., “Elementary School”, “Middle School”, “High School”, “Lower School”, “Upper School”, “College”, “University”, etc.)
- The school’s location
- The year in which the school was founded

#### **Companies**

LinkedIn allows companies to create their own pages, like the [one for LinkedIn itself](https://www.linkedin.com/company/linkedin/), so employees can identify their past or current employment with the company. Ensure that LinkedIn’s database can store the following information for each company:

- The name of the company
- The company’s industry (e.g., “Education”, “Technology, “Finance”, etc.)
- The company’s location

#### **Connections**

And finally, the essence of LinkedIn is its ability to facilitate connections between people. Ensure LinkedIn’s database can support each of the following connections.

- **Connections with People**
- **Connections with Schools**
- **Connections with Companies**

## Sample Data

Your database should be able to represent…

- A user, [Claudine Gay](https://en.wikipedia.org/wiki/Claudine_Gay), whose username is “claudine” and password is “password”.
- A user, [Reid Hoffman](https://en.wikipedia.org/wiki/Reid_Hoffman) whose username is “reid” and password is “password”.
- A school, **Harvard University**, which is a university located in Cambridge, Massachusetts, founded in 1636.
- A company, **LinkedIn**, which is a technology company headquartered in Sunnyvale, California.
- Claudine Gay’s **connection with Harvard**, pursuing a PhD from January 1st, 1993, to December 31st, 1998.
- Reid Hoffman’s **connection with LinkedIn**, with title “CEO and Chairman”, from January 1st, 2003 to February 1st, 2007

## Usage

To create a database from your schema, within your `connect` folder, type

```bash
sqlite3 connect.db
```

The above will create an empty SQLite database called `connect.db`.

Then, in the `sqlite3` prompt, type

```bash
.read `schema.sql`
```

to read the statements from `schema.sql`.

Recall you can use `DROP TABLE tablename`, where `tablename` is the name of your table, to delete a table from your database.

## How to Test

While `check50` exists for this problem, only you can ensure your database meets the [platform’s specification](https://cs50.harvard.edu/sql/2023/psets/2/connect/#platform) and that it can store the [sample data](https://cs50.harvard.edu/sql/2023/psets/2/connect/#sample-data) efficiently. Consider whether your database is fully normalized!

## Correctness

```bash
check50 cs50/problems/2023/sql/connect
```

## How to Submit

In your terminal, execute the below to submit your work.

```bash
submit50 cs50/problems/2023/sql/connect
```
