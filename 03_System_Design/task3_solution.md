# Design a Photo Uploading Web Application

Task Prompt:
You are designing data infrastructure on the cloud for a company whose main business is in processing images.

- Web application 1 
- Collects images uploaded by customers. 
- Web application 2 provides a stream of images using a Kafka stream. 
- Save processed images for a minimum of 7 days for archival purposes.
- Business Intelligence (BI) on key statistics including number and type of images processed, and by which customers.

-----------------------

### Functional Requirements
- Users able to upload photos
- Users able to view photos
- 

### Non-Functional Requirements
- High availability - almost zero downtime
- Highly reliable - no data loss when images are being uploaded


<b>High Level Architecture</b>

![high-level-architecture](https://user-images.githubusercontent.com/14856777/161397571-f0109597-d733-4714-bb39-453e56ba25b0.jpg)
