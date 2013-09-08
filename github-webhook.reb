Rebol [
	Title: "Github webhook handler"
	Author: onetom@hackerspace.sg
	Date: 2013-08-31
	Purpose: {
		Handle github post receive hooks as described at
		https://help.github.com/articles/post-receive-hooks

		Note that the JSON data is sent as URL encoded form data
		in a POST request, so the mime type is not application/json,
		but application/x-www-form-urlencoded

		Here is a similar solution in Ruby:
		https://github.com/SmartReceipt/webhook/blob/master/lib/webhook/app.rb
	}
	Description: {
		Configure by changing the 'port variable and the 'handle function.
		Remove [print data] from the 'log function to make the script silent.
	}
]

port: 6175

handle: funct [json[string!]] [
	log json
]

log: funct [data] [
	print data
	write/append %github-webhook.log rejoin [now " -- " data newline]
	data
]

listen-port: open/lines join tcp://: port
log ["Listening on port" port "..."]

forever [
	http-port: first wait listen-port
	http-port/timeout: 5
	attempt [
		request-line: first http-port

		headers: collect [
			while [not empty? line: first http-port][
				parse line [
					copy header to ":" skip (keep header)
					copy value to end (keep any [ attempt [load value]   value ])
				]
			]
		]

		body: make string! len: select headers "Content-Length"
		until [
			read-io   http-port   tail body   (len - length? body)
			len = length? body
		]

		handle find/tail dehex body "payload="

		insert http-port rejoin ["HTTP/1.0 204 No Content" crlf crlf]
	]
	close http-port
]
