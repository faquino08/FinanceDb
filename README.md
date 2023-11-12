<h1 align="center">FinanceDB</h1>

This is a project meant to help me pull financial data from my broker and compile it with publicly available data to create a centralized database of financial information. The goal is for this database to serve as the backbone for my equity analysis. It uses several docker images, each with a specific job, to act as microservices. Currently I have all the docker images running in a kubernetes cluster at home, along with a [Timescale](https://www.timescale.com/) database instance and a [Kafka Cluster](https://kafka.apache.org/) with [KSQLDB](https://ksqldb.io/). Below is a diagram showing a typical day in how these docker images, on schedule, retreive data. Only the Power Automate Desktop script requires manual activation so that it can open my broker's platform (ThinkOrSwim) and run predefined scans and transfer the exported files to TdScannerReader.

![Overview Diagram](./FinanceDB%20Overview.png)
