NanoCI
=======

NanoCI framework in bash. Checks whether there have been any updates, runs tests 
and mails you on completion.

Usage:

```
$ ./nanoci 
./nanoci [-q <pre-script>] [-w <post-script>] [-m <email>] [-a <mail command>]
   [-t <mail command attach flag>] [-s <mail command subject flag]
   [-e <recipients flag>] [-n name] [-d <dir>] [-c <command>] [-f] [-v] [-h]
   -r <repo> -l <local_checkout>

-q - script to run just before actually performing test (default /bin/true)
-w - script to run just after actually performing test (default /bin/true)
-m - email to send using "mail" command (default logs to stdout)
-a - mail command to use (default=mail)
-n - name for ci (unique, must be a valid directory name), eg myproj (default=ci)
-d - directory within repository to navigate to (default=.)
-c - test command to run from -d directory (default=./test.sh)
-t - attach argument flag for mail command (default=-A, empty string means no-attach)
-s - subject flag for mail command (default=-s)
-e - recipients flag (default=-t, empty string means no flag needed)
-f - force a run even if repo has no updates (default off)
-v - verbose logging (default off)
-h - show help
-r - git repository, eg https://github.com/myname/myproj (required)
-l - local checkout of code (that gets updated to determine whether a run is needed) (required)

EXAMPLES

- "Clone -r https://github.com/tkjef/somerepo.git if a git pull on /space/git/somerepo 
indicates there's been an update. Then navigate to test, run ./test.sh and mail 
yo@tkjef.com if there are any issues"

./nanoci \
      -r https://github.com/tkjef/somerepo.git \
      -l /space/git/somerepo \
      -d test \
      -c ./test.sh \
      -m yo@tkjef.com


- "Run the above continuously in a crontab."

  Crontab line:

* * * * * cd /path/to/nanoci && ./nanoci -r https://github.com/tkjef/somerepo.git -l /space/git/somerepo -d test -c ./test.sh -m yo@tkjef.com

- "Test nanoci with nanoci"

./nanoci \
     -q "ls -l" \
     -w "ls -l" \
     -m yo@tkjef.com \
     -n nanoci \
     -d . \
     -c /bin/true \
     -v \
     -r https://github.com/tkjef/nanoci \
     -l /space/git/nanoci \
     -f

```

## Development

*Report issues/ask questions/submit feature requests here: [GitHub Issues][issues]

Pull requests welcome!
Create a branch for each feature or fix you make with the below instructions.
If you haven't already:
1. Fork the repo
2. Clone your forked repo

Inside cloned repo directory run the below:
1. `git remote add upstream https://github.com/seeeye/nanoci.git`
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

Maintained by [tkjef][tkjef] (<yo@tkjef.com>) and a growing community of [contributors][contributors]. Forked from [ianmiell][ianmiell].

## License

MIT License, (see [LICENSE][license])  
MIT © [ianmiell][ianmiell]  
portions MIT © [tkjef][tkjef]  

[contributors]: https://github.com/seeeye/nanoci/graphs/contributors
[tkjef]: https://github.com/tkjef
[ianmiell]: https://github.com/ianmiell
[issues]: https://github.com/seeeye/nanoci/issues
[license]: https://github.com/seeeye/nanoci/blob/master/LICENSE
[twitter]: https://twitter.com/seeeye_io
[website]: http://www.seeeye.io/
