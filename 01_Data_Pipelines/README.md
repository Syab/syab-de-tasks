# To Run This Program as Scheduled Task

1. [MacOS or Linux Systems]. Launch Terminal or any terminal emulator.
```
crontab -e
```
2. Edit the cron with the last line of this code snippet.
```
# Every 10 minutes. You can change accordingly.

*/10 * * * * /path/to/this/repo/01_Data_Pipelines/processfile.sh
```
To exit the cron type ``esc`` followed by ``wq``.

3. You can add additional data files in the same format as dataset 1 and 2 into the folder ``DATA/``

## Explanation

``processfile.sh`` when run, will check if there are any new data files to be processed in the DATA folder. If there are new files, it will run ``processfile.py``. 

Data files that have been processed successfully will be moved to processed folder, with the output results located in ``OUTPUT`` folder. Otherwise, unprocessed data files will be moved to ``unprocessed`` folder.

## Results