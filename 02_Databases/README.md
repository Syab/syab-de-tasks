### TO RUN THIS PROGRAM

1. Spin up Postgres DB container. Tables will be created upon container start up
'''
docker-compose up -d
'''
2. Check if contianer is up and DB is ready to take requests.
'''

'''
3. Run python script. Script does 2 things : load mock data into the tables; run queries mentioned in task
'''
python solution.py
'''

TODO:
- add more mock data to show top 3 manufacturers