# flask mongodb

This is a demostration of running flask with mongodb database. The workflow is designed using makefile which simplify the process of running the application. 

The application is created using: 

1. flask - python framework 
2. Mongodb - database

## How to run the app. 
1. Using docker-compose 
2. Using helm charts on Kubernetes 

## Running the application using a makefile with docker-compose

1. Command to run / start the application. Run `make compose-up`
2. To stop the app using docker-compose. Run `make compose-down`


## Running the application using a makefile on kubernetes / helm

1. Command to start the application using helm. Run `make install-api`