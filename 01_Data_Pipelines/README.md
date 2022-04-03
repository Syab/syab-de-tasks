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

## Results