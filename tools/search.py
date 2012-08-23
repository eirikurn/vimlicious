import json
import httplib
import sys

if __name__ == '__main__':
    if len(sys.argv) != 2:
        sys.exit()
    c = httplib.HTTPSConnection("api.github.com")
    c.request("GET", "/legacy/repos/search/" + sys.argv[1])
    response = c.getresponse()
    data = response.read()
    d = json.loads(data)

    repos = [r for r in d['repositories'] if r['fork'] is False and 'language' in r and r['language']=='VimL' ]

    print 'Found %i repos' % (len(repos))
    for repo in repos:
        print repo['username'] + '/' + repo['name']
        if 'description' in repo:
            print '-- ' + repo['description']
        else: 
            print '-- no description'
        print
