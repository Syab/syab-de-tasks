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

### Non-Functional Requirements
- High availability - almost zero downtime
- Highly reliable - no data loss when images are being uploaded
- 7 day retension period in KStreams

## Architecture Design
<b>High Level Architecture</b>

![high-level-architecture](https://user-images.githubusercontent.com/14856777/161397571-f0109597-d733-4714-bb39-453e56ba25b0.jpg)

Cloud Provider of Choice : AWS

- Uploaded images that have been processed will be written into Kafka topic and stream
- JDBC Sink connectors to sink user data and image meta data into relational database (AWS RDS)
- Actual images will be stored in Hadoop Cluster (AWS HDFS CLuster) - Hadoop Sink Connectors.
- For analytics and visualization, ingest data from RDS to Elasticsearch, and utilise Kibana to create dashboard on user analytics.

<b>Kafka Infrastructure</b>

![Diagrams-kafka-onprem](https://user-images.githubusercontent.com/14856777/161424701-505feb83-57bf-4857-91b1-6f24a5d82a9e.jpg)

- Provision at least 3 instances of each service on Elastic Kubernetes Service
- To allow for fault tolerance and reliability
- Utilise Confluent Kafka and supplementary images
- Provision application load balancer in front of each service
- Kafka has a default of 7 day retension period, hence meets Task requiement objectives.

<b>Database Model</b>

- Since User info and image metadata can be stored and need to be referenced easily, these information can be stored in a traditional relational database. 