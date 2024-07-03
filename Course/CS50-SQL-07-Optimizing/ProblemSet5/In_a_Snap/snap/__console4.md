QUERY PLAN
|--SCAN messages USING COVERING INDEX search_messages_by_to_user_id
|--SEARCH users USING INTEGER PRIMARY KEY (rowid=?)
`--USE TEMP B-TREE FOR ORDER BY
|       username       |
|----------------------|
| charminghappiness484 |
