# CPS853-Crime-Statistics
As part of Creating Big Data Systems Course Project

# Proposal


**Dataset link**  - [Crime Data from 2020 to 2024](https://catalog.data.gov/dataset/crime-data-from-2020-to-present)


**License** - Public Domain


**Size in rows**: 1,004,894


**Megabytes**: 288 MB


**Event time column** : TIME OCC 


The reason that we chose this dataset is because we want to explore which recorded crime types are the most common and how incident counts differ between police areas. The dataset also makes a bridge between a real world topic and the technical work of utilizing a dataset. 


### Questions


1. What are the ten most common recorded crime types in this dataset? 
2. Which five LAPD areas have the most recorded incidents in this dataset? 
3. How many recorded incidents occurred on each day, based on the records received so far? 

### Storage Format 


Storage format: Postgres


#### Why?

###### First Option: Postgres


Postgres handles ACID properties as data scales. It allows multiple concurrent read, write on the database per user which is useful when handling crime data as each precinct would need to update the database of crimes. Postgres also scales horizontally and vertically when data size gets large 


###### Other Alternative: MongoDB


MongoDB is a non-relational database for unstructured data that has a schema that is frequently changing. For a national crime database, the columns have to be consistent over the years as there are often people who retire and new personnel changes happening, so if the data is consistent it is easier to translate and document to train others. Hence for this use case, we require a relational database such as Postgres, which can scale in terms of storage over the years, and helps with concurrent read, write transactions with lossless changes.

### Our Focus
The main focus of this data is going to be the best way we can deliver the data in real time. Crime statistics are important to everyday safety and the faster authorities are able to get results the faster decisions are made

#### What will we change?
- Consolidate features to ensure irrelevant data isn’t displayed to the intended audience
- Aggregate data by area that the crime occurred and list the ongoing investigations 
#### What will we measure?
- Crime occurred in a certain time frame in an area
- Real time alerts of crime that occurred
- Display on a dashboard or an UI of the overall summary of crimes

#### What success looks like?
- Able to display the data to intended users
- Process the data efficiently 
- Cache necessary information



#### Two Biggest Risks
1. Wait time for users while data size scales up
As the data grows, there can be an issue where we might have to change our database to something that can allow flexible storage. The plan is to have an in memory database for those records accessed frequently so that when the database gets too big, it doesn’t affect users waiting on results.


2. Increased processing time for data as it scales
We can distribute the load on different machines  as the data size grows. Right now we have about 1 million rows, so if there is data coming in as a batch of more than 10 million in one day, we need to create another process for that threshold so that it will be processed differently.


