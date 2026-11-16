# CPS853-Crime-Statistics
As part of Creating Big Data Systems Course Project

# Set Up

**Pre-Requisites**
> Have Git installed
> Clone this repository in local
 >   * Go to Code and click on Clone
 >   * Copy url into terminal and type git clone <paste the url>

**Docker Installation**

> [Windows Installation](https://docs.docker.com/desktop/setup/install/windows-install/)
> [MacOS Installation](https://docs.docker.com/desktop/setup/install/mac-install/)
> [Linux Distributions](https://docs.docker.com/engine/install/)

---

**File Set up**
> Download the file from the Dataset link given below in the proposal
> Copy and paste this command into your file directory (the path should be pointing to the folder /CPS853-Crime-Statistics)
  `docker compose up`
> Go to Docker desktop
> Go to Containers
> Click on 3 dot next to spark and click on view details
> Go to url link starting with 127

---

# Proposal


**Dataset link**  - [Crime Data from 2020 to 2024](https://catalog.data.gov/dataset/crime-data-from-2020-to-present)


**License** - Public Domain


**Size in rows**: 1,004,894


**Megabytes**: 288 MB


**Event time column** : DATE OCC + TIME OCC 


The reason that we chose this dataset is because we want to explore which recorded crime types are the most common and how incident counts differ between areas in the LAPD region. The dataset also makes a bridge between a real world topic and the technical work of utilizing a dataset. 


### Questions


1. What are the ten most common recorded crime types in this dataset? 
2. Which five LAPD areas have the most recorded incidents in this dataset? 
3. How many recorded incidents occurred on each day, based on the records received so far? 

### Storage Format 


•	Primary Choice: Apache Parquet compared with CSV for Part 1 (Store and Batch).


•	Explanation: Parquet uses columnar compression, reduces disk usage, and accelerates read times for Spark compared to row-based CSV.


# Serve

## Our Focus: Postgres
Postgres handles **ACID properties** as data scales. It allows multiple concurrent reads and writes on the database per user, which is essential when handling crime data, as each precinct needs to update the database simultaneously. Postgres also scales horizontally and vertically as data size grows.

---

### 🛠 Action Plan

* **What will we change?**
  Introduce PostgreSQL database indexes—such as `B-Tree` indexes on frequently queried columns like `crime type`, `LAPD area`, and `timestamp`—and perform database tuning.

* **What will we measure?**
  Average query response times (in milliseconds) for our three main questions before and after adding the indexes.

> **🎯 What success looks like:**
> Achieve at least a **50% decrease** in average query execution time under simultaneous batch-and-stream load, or maintain **sub-50ms** query response times.


# Risk Mitigation

## Two Biggest Risks

### ⚠️ Risk 1: Resource Constraints on One Laptop
Running `Kafka`, `Spark`, `PostgreSQL`, and `Docker` together on a single laptop with 8GB of memory could lead to out-of-memory (OOM) errors and resource exhaustion.

> **Plan:** Optimize Spark executor/driver RAM limits, enforce lower Docker memory footprints, use micro-batches for the Kafka stream to maintain low window buffers, and process raw files iteratively.

---

### 🤝 Risk 2: Scope and Coordination for Two People
Completing four complex, end-to-end modules within the project constraints with just a two-person team.

> **Plan:** Define strict module interfaces, divide work incrementally, use a shared `Git` repository with feature branches, and test the ingestion pipeline early using smaller data samples.



