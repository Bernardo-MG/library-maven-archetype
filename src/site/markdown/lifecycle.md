# Project life cycle

A central point to the archetype configuration is the project life cycle it is meant for.

Which is a very simple life cycle, consisting on three steps:

- Building and testing the project
- Publishing documentation
- Publishing code artifacts

This lifecycle begins each time a change is pushed to the code repository. But it has an additional layer, as there are three targets, which will modify how these steps work:

- Release target and snapshot target, which deploy artifacts to the releases and snapshots repositories respectively
- Feature target, which doesn't publish anything, but still build and tests

![Project life cycle](./images/project_life_cycle.png)

To handle all this, the different repositories are integrated using the CI service, which will react each time new code is pushed to the code repository.

At that point the target is picked, based on which branch the code has been pushed to, being the 'master' branch the one which sets the release target, while the 'develop' branch sets the snapshots target, and any other just sets the feature target.

![Target selection process](./images/target_selection.png)

The way this is actually handled can be found on the [CI](./travis.html) section.

Also take a look at the [repositories](./repos.html) required.

## The targets

### Release

When a push is done to the 'master' branch the deployment target is selected.

After building and testing, the project will be sent to the releases repository, and the documentation will be published on the releases documentation repository.

The releases repository is identified as 'releases' on the POM, while the documentation one is identified as 'site'.

### Snapshot

When a push is done to the 'develop' branch the snapshot target is selected.

After building and testing, the project will be sent to the snapshots repository, and the documentation will be published on the snapshots documentation repository.

The snapshots repository is identified as 'snapshots' on the POM, while the development documentation one is identified as 'site-development'.

### Feature

Any push to any other branch is considered a feature. Nothing will be published in any repository, but the building and testing will still be done.

## Additional comments

Publishing artifacts should always be taken with care, but the current configuration offers little control over it. It falls on the repositories side taking care of any additional procedures.

For example, it is not a good idea publishing automatically the releases without any additional control, but Bintray, for which the archetype is prepared by default, will ask the repository manager before publishing any new release.