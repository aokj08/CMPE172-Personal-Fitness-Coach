# CMPE172-Personal-Fitness-Coach

## How to import the database
- git clone this repository OR git pull origin main
- go to the directory where you have the `project_db_backup.sql` file
- type in `mysql -u <your_username> -p < project_db_backup.sql`
- enter your password for mysql
- now you can log into your mysql 
- once you are logged in, enter `USE project_db`

## How to export the database
- after modifying the database, enter `mysqldump -u <your_username> -p project_db > project_db_backup.sql`
- enter your password for mysql
- git add `project_db_backup.sql`
- git commit -m "<specific message like updated User table>"
- git push origin main
