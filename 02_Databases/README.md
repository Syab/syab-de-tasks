# To Run This Program

1. Spin up Postgres DB container. Tables will be created upon container start up
```
docker-compose up -d
```
2. Check if contianer is up and DB is ready to take requests.
```
docker-compose ps -a
```
3. Run python script. Script does 2 things : load mock data into the tables; run queries mentioned in task
```
python task2_solution.py
```

## Results

Query 1:
![Screenshot 2022-04-03 at 01 59 42](https://user-images.githubusercontent.com/14856777/161395704-b138dbf4-71ba-418d-b866-974dbc7ac837.png)


Query 2:
![Screenshot 2022-04-03 at 01 59 52](https://user-images.githubusercontent.com/14856777/161395702-ba2f5294-8e83-4164-8a80-3fcc475e5a53.png)


