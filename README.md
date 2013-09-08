github-webhook
==============

A cross-platform, Rebol 2 script for handling Github post receive web hook requests.

Usage
----------

Customize the port number in the source code if required, then start it as follows:

    ---==| ~/p/github-webhook |==---
    $ rebol -qws github-webhook.reb
    Listening on port 6175 ...

Put your conditions and actions into the HANDLE function. It receives the JSON data as an undecoded string for maximum simplicity and to keep dependencies minimal.

Restricting action to pushes into a certain branch could be implemented as simply as:

    if find json {"ref":"refs/heads/master"} [ call "CI-script" ]


Example Github request
-----------------------------------

<pre>
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
</pre>
(without new line at the end)

This looks like the following after undoing the url-encoding (and breaking into multiple lines along commas for readability):

<pre>
{payload={"ref":"refs/heads/master",
"after":"4d9840f8e661e7067472e828ee6ad8dd3008b247",
"before":"1acddad803a6de4e11cf310fd6430eafdad94f47",
"created":false,"deleted":false,"forced":false,"compare":"https://github.com/onetom/rebol/compare/1acddad803a6...4d9840f8e661",
"commits":[{"id":"b68ddee5cf77b8d35bb9ac32692fba26f42eb9e1",
"distinct":true,"message":"HTTP:+remove+auto-decoding+of+UTF-8+content\n\nWhen+READing+via+HTTP+(without+/string+or+/lines),+no+longer+auto-decode\nUTF-8+encoded+content+to+a+string!.+Always+return+a+binary!+instead.\n\nThe+auto-decoding+feature+removed+by+this+commit+lead+to+brittle+code,\nwhen+developers+testing+with+a+site+that+by+chance+returned+a+string!\nwere+lead+to+believe+that+an+http://+READ+always+returns+a+string!.\n\nThis+fixes+CureCode+issue+#2027.\n\nFix+as+originally+suggested+by+Graham+Chiu.",
"timestamp":"2013-08-18T01:45:46-07:00",
"url":"https://github.com/onetom/rebol/commit/b68ddee5cf77b8d35bb9ac32692fba26f42eb9e1",
"author":{"name":"Andreas+Bolka",
"email":"a@bolka.at",
"username":"earl"},"committer":{"name":"Andreas+Bolka",
"email":"a@bolka.at",
"username":"earl"},"added":[],"removed":[],"modified":["src/mezz/prot-http.r"]},{"id":"f7a42a31e1744821ae304458af5448ec10764720",
"distinct":true,"message":"Merge+pull+request+#129+from+earl/fix-2027-read-utf8-http\n\nHTTP:+remove+auto-decoding+of+UTF-8+content+(cc#2027)",
"timestamp":"2013-08-18T15:32:54-07:00",
"url":"https://github.com/onetom/rebol/commit/f7a42a31e1744821ae304458af5448ec10764720",
"author":{"name":"Carl+Sassenrath",
"email":"cs2@rebol.com",
"username":"carls"},"committer":{"name":"Carl+Sassenrath",
"email":"cs2@rebol.com",
"username":"carls"},"added":[],"removed":[],"modified":["src/mezz/prot-http.r"]},{"id":"9fe6ef81e7f9502d15177062c2f262a33290fbf4",
"distinct":true,"message":"Added+Greggs+updated+split+from+http://issue.cc/r3/1886",
"timestamp":"2013-08-18T17:35:31-07:00",
"url":"https://github.com/onetom/rebol/commit/9fe6ef81e7f9502d15177062c2f262a33290fbf4",
"author":{"name":"johnk-",
"email":"john@johnandelizabeth.com",
"username":"johnk-"},"committer":{"name":"johnk-",
"email":"john@johnandelizabeth.com",
"username":"johnk-"},"added":[],"removed":[],"modified":["src/mezz/mezz-series.r"]},{"id":"4d9840f8e661e7067472e828ee6ad8dd3008b247",
"distinct":true,"message":"Merge+pull+request+#130+from+johnk-/master\n\nAdded+Greggs+updated+split+from+http://issue.cc/r3/1886.\r\nUpdating+it+for+now,+just+so+we+have+the+latest,+but+the+discussion+is+still+open.",
"timestamp":"2013-08-18T20:51:32-07:00",
"url":"https://github.com/onetom/rebol/commit/4d9840f8e661e7067472e828ee6ad8dd3008b247",
"author":{"name":"Carl+Sassenrath",
"email":"cs2@rebol.com",
"username":"carls"},"committer":{"name":"Carl+Sassenrath",
"email":"cs2@rebol.com",
"username":"carls"},"added":[],"removed":[],"modified":["src/mezz/mezz-series.r"]}],"head_commit":{"id":"4d9840f8e661e7067472e828ee6ad8dd3008b247",
"distinct":true,"message":"Merge+pull+request+#130+from+johnk-/master\n\nAdded+Greggs+updated+split+from+http://issue.cc/r3/1886.\r\nUpdating+it+for+now,+just+so+we+have+the+latest,+but+the+discussion+is+still+open.",
"timestamp":"2013-08-18T20:51:32-07:00",
"url":"https://github.com/onetom/rebol/commit/4d9840f8e661e7067472e828ee6ad8dd3008b247",
"author":{"name":"Carl+Sassenrath",
"email":"cs2@rebol.com",
"username":"carls"},"committer":{"name":"Carl+Sassenrath",
"email":"cs2@rebol.com",
"username":"carls"},"added":[],"removed":[],"modified":["src/mezz/mezz-series.r"]},"repository":{"id":6765113,"name":"rebol",
"url":"https://github.com/onetom/rebol",
"description":"REBOL+language+development+source",
"watchers":0,"stargazers":0,"forks":0,"fork":true,"size":583,"owner":{"name":"onetom",
"email":"hermantamas@gmail.com"},"private":false,"open_issues":0,"has_issues":false,"has_downloads":true,"has_wiki":false,"language":"C",
"created_at":1353349791,"pushed_at":1377711696,"master_branch":"master"},"pusher":{"name":"none"}}}
</pre>
