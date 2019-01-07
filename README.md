NanoCD
=======

NanoCD framework in bash for Mac. Checks git for updates, deploys code, runs tests, mails you on completion.  
Allows for promotion to next env.  

Dependencies for Mac. Install parallel, timeout + hub with the below:  
```
brew install parallel
brew install coreutils
brew install hub
```

NanoCD Installation:  
```
(cd /usr/local/bin && curl -O https://github.com/tkjef/NanoCD/blob/master/nanocd)
```

Usage:  
```
$ nanocd
nanocd -r <repo> -l <local_checkout> [-b <build-script>] [-w <post-script>]
   [-m <email>] [-a <mail command>] [-t <mail command attach flag>]
   [-s <mail command subject flag] [-e <recipients flag>] [-n name] [-d <dir>] 
   [-c <command>] [-f] [-v] [-h] [-p] [-z]

REQUIRED ARGS:
-r - git repository, eg https://github.com/myname/myproj.git (required)
-l - local checkout of code (that gets updated to determine whether a run is needed) (required)

OPTIONAL ARGS:
-b - build script to run (default $BUILD_SCRIPT)
-w - script to run just after actually performing test (default $DEPLOY_SCRIPT)
-m - email address to send to using "mail" command (default logs to stdout)
-a - mail command to use (default=$MAIL_CMD)
-n - name for ci (unique, must be a valid directory name), eg myproj (default=$PROJECT_NAME)
-d - directory within repository that contains test scripts (default=$TEST_DIR)
-c - test command to run from -d directory (default=$TEST_COMMAND)
-t - attach argument flag for mail command (default=$MAIL_CMD_ATTACH_FLAG, empty string means no-attach)
-f - force a run even if repo has no updates (default off)
-v - verbose logging (default off)
-p - create pull request, merge pull request, set -f flag
-i - timeout in seconds (default 86400, ie one day, does KILL one hour after that)
-h - show help
-z - when using an ssg (static site generator) this generates the public code to be committed (default=$SSG_BUILD_SCRIPT)

EXAMPLES

- "Clone -r https://github.com/myname/myproj.git if a git fetch on /path/to/git/root/ indicates there's been an update.
  Then navigate to tests (default), run ./test.sh and mail your@email.tld after successfull or failed completion with results"

  nanocd -r https://github.com/myname/myproj.git -l /path/to/git/root/ -d tests -c ./test.sh -m your@email.tld
  nanocd -r https://github.com/myname/myproj.git -l /path/to/git/root/ -m your@email.tld
  nanocd -r https://github.com/myname/myproj.git -l /path/to/git/root/

- "Run this continuously in a crontab."

  Crontab line to run every 30 min:
  0,30 * * * * nanocd -r https://github.com/myname/myproj.git -l /path/to/git/root/
```

## Development

*Report issues/ask questions/submit feature requests here: [GitHub Issues][issues]

Pull requests welcome!
Create a branch for each feature or fix you make with the below instructions.
If you haven't already:
1. Fork the repo
2. Clone your forked repo

Inside cloned repo directory run the below:
1. `git remote add upstream https://github.com/tkjef/nanocd.git`
2. `git fetch upstream`
3. `git checkout master`
4. `git rebase upstream/master`
5. `git checkout -b new_feature_or_fix`
6. `git commit -am 'Added feature or fix'`
7. `git push origin new_feature_or_fix`)
8. Create new Pull Request

After pull request is merged run the below:
1. `git fetch upstream`
2. `git checkout master`
3. `git rebase upstream/master`
4. `git push`

## Authors

Maintained by [tkjef][tkjef] (<yo@tkjef.com>) and a growing community of [contributors][contributors]. Forked from [cheapci][cheapci].

## License

MIT License, (see [LICENSE][license])  
MIT © [ianmiell][ianmiell]  
portions MIT © [tkjef][tkjef]  

[contributors]: https://github.com/tkjef/nanocd/graphs/contributors
[tkjef]: https://github.com/tkjef
[ianmiell]: https://github.com/ianmiell
[cheapci]: https://github.com/ianmiell/cheapci
[issues]: https://github.com/tkjef/nanocd/issues
[license]: https://github.com/tkjef/nanocd/blob/master/LICENSE
[twitter]: https://twitter.com/tkjef
[website]: http://www.tkjef.com/

## Project Roadmap

Version 0.4  
    -add automatic Version tagging with Github  

Version 0.5  
    -add better integrity check on pull request being used to cover any edge cases  
    -add artifact versioning using Github, Artifactory or Nexus  

Version 0.6  
    -add rollback to previous version or specific version capability  

Version 0.7  
    -set generic deploy script to aws s3 that only uploads files that were added/edited,  
    removes files that were removed  
    -add better testing options  

Version 0.8  
    -add automatic promotion to envs, deploy to specific env  
    -add slack alerts  

Version 0.9  
    -add mute/unmute monitoring alerts option for:  
    datadog, newrelic, grafana, pagerduty, opsgenie, victorops or custom script.  

Version 1.0  
    -polish step-based workflow  

Version 1.1  
    -add advanced load test templates  
