For loops :-
Eg1:- 
#!/bin/bash
for item in apple banana orange; do
  echo "Current fruit: $item"
done

Eg2:- 
#!/bin/bash
# Iterate from 1 to 5, incrementing by 1 (default)
for i in {1..5}; do
  echo "Number: $i"
done

Eg3:- 
# Iterate from 1 to 10, incrementing by 2
for j in {1..10..2}; do
  echo "Even number: $j"
done


Eg4:-
#!/bin/bash
# Process all .txt files in the current directory
for file in *.txt; do
  echo "Processing file: $file"
  # Example: count lines in each file
  wc -l "$file"
done


-----

To move to the next line in linux scripts - 
We use \n
Eg:- echo "First line\nSecond line"


-----

The curl command in Linux is a versatile tool for transferring data with URLs. Here are some common sample curl commands:
1. Basic GET Request:
To retrieve the content of a webpage and display it in the terminal:
Code:-
curl https://www.example.com

2. Saving Output to a File:
To download a file and save it with a specified name:
Code:-
curl -o local_filename.html https://www.example.com/page.html

To download a file and save it with the same name as on the remote server:
Code
curl -O https://www.example.com/image.jpg

3. Following Redirects:
To automatically follow HTTP redirects (e.g., from http to https or non-www to www):
Code
curl -L http://example.com

4. Fetching HTTP Headers Only:
To retrieve only the HTTP headers of a response without the body content:
Code
curl -I https://www.example.com

5. Sending a POST Request with Data:
To send data to a server using the POST method, often used for submitting forms or API requests:
Code
curl -X POST -H "Content-Type: application/json" -d '{"key": "value", "another_key": "another_value"}' https://api.example.com/data

6. Authenticated Requests:
To access resources requiring username and password authentication:
Code
curl -u username:password https://secure.example.com/protected_resource

7. Uploading a File via FTP:
To upload a file to an FTP server:
Code
curl -T local_file.txt -u ftp_user:ftp_pass ftp://ftp.example.com/remote_directory/

------
