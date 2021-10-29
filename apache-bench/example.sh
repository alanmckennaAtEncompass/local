# example POST request to localhost port 8080 using json test data
ab -T 'application/json' -n 10 -c 10 -p ./test-data.json  "http://localhost:8080/csa/api/search"
