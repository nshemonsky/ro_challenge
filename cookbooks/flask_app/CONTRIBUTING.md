# Contributing

We love pull requests. Here is a quick guide.

* Submit a ticket for your issue in JIRA, assuming one does not already exist.
    * Clearly describe the issue including steps to reproduce when it is a bug.
    * Make sure you provide the earliest version that you know has the issue.

* Fork the repo in Stash, then clone your fork:

```
git clone ssh://git@gitlab.com/leadid-ops/<repo>.git
```

* Create a new task branch from where you would like to base your work.
    * This is usually the master branch.
    * Do not work directly on the master or develop branches.

* Push to your fork and submit a pull request to the Develop branch of this
project.
    * Your pull request will be reviewed by the DevOps Team.
    * Through comments on the pull request, you may be asked to make further
      modifications to your code. If required, you may make changes in your
      fork, commit them, and push. This will automatically update the pull
      request with the changes you have made.
    * If merged, your changes will become part of the current line of bug fixes
      and features in a pre-release state on the develop branch and will be
      released according to the next release schedule.

* To increase the likelihood of your PR being accepted, please:
    * Write a [good commit message][commit].
    * Write tests, when applicable.

[commit]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
