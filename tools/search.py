import json
import httplib
import sys

def cout(text, col='93'):
   """
   Creates a color output.
   """
   print '\033[' + col + 'm' + text + '\033[0m'


if __name__ == '__main__':
    repo_search_string = sys.argv[1]
    # Check if we have the correct number of arguments from stdin.
    # We only want two arguments, the script name and the search string.
    if len(sys.argv) != 2:
        sys.exit()

    # We are searching for a repo via the githup api. Thus we only allow legal
    # repo names with repsect to github rules.

    c = httplib.HTTPSConnection("api.github.com")
    c.request("GET", "/legacy/repos/search/%s?language=VimL" % repo_search_string)
    response = c.getresponse()
    data = response.read()
    d = json.loads(data)

    repos = [r for r in d['repositories'] if r['fork'] is False and repo_search_string in r['name']]
    repos.sort(key=lambda r: r['forks'], reverse=True)

    if len(repos) == 0:
        cout('No GIT repository found with name "%s"' % (repo_search_string), '91')
        sys.exit()
    
    cout('Found %i GIT repositories matching the name "%s"' % (len(repos), repo_search_string))
    for repo in repos:
        cout(repo['username'] + '/' + repo['name'], "94")
        if 'description' in repo:
            print '- ' + repo['description']
