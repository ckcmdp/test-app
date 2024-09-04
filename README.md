# README
After starting the rails server, please use these endpoints to test the API working

Update the credentials and token as per the local development credentials

curl -X POST http://localhost:3000/api/login -d "email=member2@gmail.com&password=Chandan"

## Register API
curl -X POST http://localhost:3000/api/register -d "email=member2@gmail.com&password=Chandan&role=member&name=Chandan"

## Login API
curl -X POST http://localhost:3000/api/login -d "email=c@b.com&password=Chandan"

## create tasks API
curl -X POST http://localhost:3000/api/tasks -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozfQ.7ahDwRQB_XNdEuNJxsEpB9udaA1Zn2GlkqN4TieRj9w" -d "task[title]=New Task&task[description]=Task description"

## Task Assign API
curl -X POST http://localhost:3000/api/tasks/1/assign -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozfQ.7ahDwRQB_XNdEuNJxsEpB9udaA1Zn2GlkqN4TieRj9w" -d "user_id=1"

## assigned tasks API
curl -X GET http://localhost:3000/api/tasks/assigned -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.dKDWC75kZLfsZE7nx18bTZP6o1bKPBA6IcbMsMzsvzY"


## complete an assigned tasks API

curl -X PATCH http://localhost:3000/api/tasks/1/complete -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.dKDWC75kZLfsZE7nx18bTZP6o1bKPBA6IcbMsMzsvzY"
