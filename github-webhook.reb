Example request:

---==| ~/p/github-webhook |==---
$ nc -l 6175
POST /webhook HTTP/1.1
Host: talk.rebol.info:6175
Accept: */*
User-Agent: GitHub Hookshot 3372f36
X-GitHub-Event: push
X-GitHub-Delivery: 75e732d8-1237-11e3-9480-a3b78209a4ae
content-type: application/x-www-form-urlencoded
Content-Length: 5497

payload=%7B%22ref%22%3A%22refs%2Fheads%2Fmaster%22%2C%22after%22%3A%224d9840f8e661e7067472e828ee6ad8dd3008b247%22%2C%22before%22%3A%221acddad803a6de4e11cf310fd6430eafdad94f47%22%2C%22created%22%3Afalse%2C%22deleted%22%3Afalse%2C%22forced%22%3Afalse%2C%22compare%22%3A%22https%3A%2F%2Fgithub.com%2Fonetom%2Frebol%2Fcompare%2F1acddad803a6...4d9840f8e661%22%2C%22commits%22%3A%5B%7B%22id%22%3A%22b68ddee5cf77b8d35bb9ac32692fba26f42eb9e1%22%2C%22distinct%22%3Atrue%2C%22message%22%3A%22HTTP%3A+remove+auto-decoding+of+UTF-8+content%5Cn%5CnWhen+READing+via+HTTP+%28without+%2Fstring+or+%2Flines%29%2C+no+longer+auto-decode%5CnUTF-8+encoded+content+to+a+string%21.+Always+return+a+binary%21+instead.%5Cn%5CnThe+auto-decoding+feature+removed+by+this+commit+lead+to+brittle+code%2C%5Cnwhen+developers+testing+with+a+site+that+by+chance+returned+a+string%21%5Cnwere+lead+to+believe+that+an+http%3A%2F%2F+READ+always+returns+a+string%21.%5Cn%5CnThis+fixes+CureCode+issue+%232027.%5Cn%5CnFix+as+originally+suggested+by+Graham+Chiu.%22%2C%22timestamp%22%3A%222013-08-18T01%3A45%3A46-07%3A00%22%2C%22url%22%3A%22https%3A%2F%2Fgithub.com%2Fonetom%2Frebol%2Fcommit%2Fb68ddee5cf77b8d35bb9ac32692fba26f42eb9e1%22%2C%22author%22%3A%7B%22name%22%3A%22Andreas+Bolka%22%2C%22email%22%3A%22a%40bolka.at%22%2C%22username%22%3A%22earl%22%7D%2C%22committer%22%3A%7B%22name%22%3A%22Andreas+Bolka%22%2C%22email%22%3A%22a%40bolka.at%22%2C%22username%22%3A%22earl%22%7D%2C%22added%22%3A%5B%5D%2C%22removed%22%3A%5B%5D%2C%22modified%22%3A%5B%22src%2Fmezz%2Fprot-http.r%22%5D%7D%2C%7B%22id%22%3A%22f7a42a31e1744821ae304458af5448ec10764720%22%2C%22distinct%22%3Atrue%2C%22message%22%3A%22Merge+pull+request+%23129+from+earl%2Ffix-2027-read-utf8-http%5Cn%5CnHTTP%3A+remove+auto-decoding+of+UTF-8+content+%28cc%232027%29%22%2C%22timestamp%22%3A%222013-08-18T15%3A32%3A54-07%3A00%22%2C%22url%22%3A%22https%3A%2F%2Fgithub.com%2Fonetom%2Frebol%2Fcommit%2Ff7a42a31e1744821ae304458af5448ec10764720%22%2C%22author%22%3A%7B%22name%22%3A%22Carl+Sassenrath%22%2C%22email%22%3A%22cs2%40rebol.com%22%2C%22username%22%3A%22carls%22%7D%2C%22committer%22%3A%7B%22name%22%3A%22Carl+Sassenrath%22%2C%22email%22%3A%22cs2%40rebol.com%22%2C%22username%22%3A%22carls%22%7D%2C%22added%22%3A%5B%5D%2C%22removed%22%3A%5B%5D%2C%22modified%22%3A%5B%22src%2Fmezz%2Fprot-http.r%22%5D%7D%2C%7B%22id%22%3A%229fe6ef81e7f9502d15177062c2f262a33290fbf4%22%2C%22distinct%22%3Atrue%2C%22message%22%3A%22Added+Greggs+updated+split+from+http%3A%2F%2Fissue.cc%2Fr3%2F1886%22%2C%22timestamp%22%3A%222013-08-18T17%3A35%3A31-07%3A00%22%2C%22url%22%3A%22https%3A%2F%2Fgithub.com%2Fonetom%2Frebol%2Fcommit%2F9fe6ef81e7f9502d15177062c2f262a33290fbf4%22%2C%22author%22%3A%7B%22name%22%3A%22johnk-%22%2C%22email%22%3A%22john%40johnandelizabeth.com%22%2C%22username%22%3A%22johnk-%22%7D%2C%22committer%22%3A%7B%22name%22%3A%22johnk-%22%2C%22email%22%3A%22john%40johnandelizabeth.com%22%2C%22username%22%3A%22johnk-%22%7D%2C%22added%22%3A%5B%5D%2C%22removed%22%3A%5B%5D%2C%22modified%22%3A%5B%22src%2Fmezz%2Fmezz-series.r%22%5D%7D%2C%7B%22id%22%3A%224d9840f8e661e7067472e828ee6ad8dd3008b247%22%2C%22distinct%22%3Atrue%2C%22message%22%3A%22Merge+pull+request+%23130+from+johnk-%2Fmaster%5Cn%5CnAdded+Greggs+updated+split+from+http%3A%2F%2Fissue.cc%2Fr3%2F1886.%5Cr%5CnUpdating+it+for+now%2C+just+so+we+have+the+latest%2C+but+the+discussion+is+still+open.%22%2C%22timestamp%22%3A%222013-08-18T20%3A51%3A32-07%3A00%22%2C%22url%22%3A%22https%3A%2F%2Fgithub.com%2Fonetom%2Frebol%2Fcommit%2F4d9840f8e661e7067472e828ee6ad8dd3008b247%22%2C%22author%22%3A%7B%22name%22%3A%22Carl+Sassenrath%22%2C%22email%22%3A%22cs2%40rebol.com%22%2C%22username%22%3A%22carls%22%7D%2C%22committer%22%3A%7B%22name%22%3A%22Carl+Sassenrath%22%2C%22email%22%3A%22cs2%40rebol.com%22%2C%22username%22%3A%22carls%22%7D%2C%22added%22%3A%5B%5D%2C%22removed%22%3A%5B%5D%2C%22modified%22%3A%5B%22src%2Fmezz%2Fmezz-series.r%22%5D%7D%5D%2C%22head_commit%22%3A%7B%22id%22%3A%224d9840f8e661e7067472e828ee6ad8dd3008b247%22%2C%22distinct%22%3Atrue%2C%22message%22%3A%22Merge+pull+request+%23130+from+johnk-%2Fmaster%5Cn%5CnAdded+Greggs+updated+split+from+http%3A%2F%2Fissue.cc%2Fr3%2F1886.%5Cr%5CnUpdating+it+for+now%2C+just+so+we+have+the+latest%2C+but+the+discussion+is+still+open.%22%2C%22timestamp%22%3A%222013-08-18T20%3A51%3A32-07%3A00%22%2C%22url%22%3A%22https%3A%2F%2Fgithub.com%2Fonetom%2Frebol%2Fcommit%2F4d9840f8e661e7067472e828ee6ad8dd3008b247%22%2C%22author%22%3A%7B%22name%22%3A%22Carl+Sassenrath%22%2C%22email%22%3A%22cs2%40rebol.com%22%2C%22username%22%3A%22carls%22%7D%2C%22committer%22%3A%7B%22name%22%3A%22Carl+Sassenrath%22%2C%22email%22%3A%22cs2%40rebol.com%22%2C%22username%22%3A%22carls%22%7D%2C%22added%22%3A%5B%5D%2C%22removed%22%3A%5B%5D%2C%22modified%22%3A%5B%22src%2Fmezz%2Fmezz-series.r%22%5D%7D%2C%22repository%22%3A%7B%22id%22%3A6765113%2C%22name%22%3A%22rebol%22%2C%22url%22%3A%22https%3A%2F%2Fgithub.com%2Fonetom%2Frebol%22%2C%22description%22%3A%22REBOL+language+development+source%22%2C%22watchers%22%3A0%2C%22stargazers%22%3A0%2C%22forks%22%3A0%2C%22fork%22%3Atrue%2C%22size%22%3A583%2C%22owner%22%3A%7B%22name%22%3A%22onetom%22%2C%22email%22%3A%22hermantamas%40gmail.com%22%7D%2C%22private%22%3Afalse%2C%22open_issues%22%3A0%2C%22has_issues%22%3Afalse%2C%22has_downloads%22%3Atrue%2C%22has_wiki%22%3Afalse%2C%22language%22%3A%22C%22%2C%22created_at%22%3A1353349791%2C%22pushed_at%22%3A1377711696%2C%22master_branch%22%3A%22master%22%7D%2C%22pusher%22%3A%7B%22name%22%3A%22none%22%7D%7D
(without the new line at the end!)

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
