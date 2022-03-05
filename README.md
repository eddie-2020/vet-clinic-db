# Vet-Clinic-Database

In this project I have created a relational database to create the initial data structure for a vet clinic. I have created a table to store animals' information, insert some data into it, and query it.

# Results

![](/assets/createTable1.PNG)
![](/assets/createTable2.PNG)

# Prerequisite

- Create a table named `animals` with the following columns:
 - `id`: integer
 - `name`: string
 - `date_of_birth`: date
 - `escape_attempts`: integer
 - `neutered`: boolean
 - `weight_kg`: decimal

- Add a column `species` of type `string` to your `animals` table. Modify your  `schema.sql` file.
- Insert the following data:
 - Animal: His name is Charmander. He was born on Feb 8th, 2020, and currently weighs -11kg. He is not neutered and he has never tried to escape.
 - Animal: Her name is Plantmon. She was born on Nov 15th, 2022, and currently weighs -5.7kg. She is neutered and she has tried to escape 2 times.
 - Animal: His name is Squirtle. He was born on Apr 2nd, 1993, and currently weighs -12.13kg. He was not neutered and he has tried to escape 3 times.
 - Animal: His name is Angemon. He was born on Jun 12th, 2005, and currently weighs -45kg. He is neutered and he has tried to escape once.
 - Animal: His name is Boarmon. He was born on Jun 7th, 2005, and currently weighs 20.4kg. He is neutered and he has tried to escape 7 times.
 - Animal: Her name is Blossom. She was born on Oct 13th, 1998, and currently weighs 17kg. She is neutered and she has tried to escape 3 times.

## Getting Started

This repository includes files with plain SQL that can be used to recreate a database:

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database. **Important note: this file might include queries that make changes in the database (e.g., remove records). Use them responsibly!**

## Database with the 6 connected ``queries`` (Database Diagram)

## After adding FK indexes to animal table
![](/assets/drawSQL-export-2022-03-05_00_27.png)

## Phase II medical diagram
![](/assets/drawSQL-export-2022-03-05_00_26.png)

## Authors

👤 **Author1**

- GitHub: [@oluyaratosin123](https://github.com/oluyaratosin123)
- Twitter: [@TOluyara](https://twitter.com/TOluyara)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/edward-oluyara/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!


## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc

## 📝 License

This project is [MIT](./MIT.md) licensed.
