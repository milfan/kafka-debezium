# kafka-debezium

[Debezium](https://debezium.io) is an open source distributed platform for change data capture. Start it up, point it at your databases, and your apps can start responding to all of the inserts, updates, and deletes that other apps commit to your databases. Debezium is durable and fast, so your apps can respond quickly and never miss an event, even when things go wrong.

I used it for stream data from SQL Server from several tables and manipulate it using my golang application and then store it to mongoDB.