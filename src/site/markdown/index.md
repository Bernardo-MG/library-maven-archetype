# Maven Archetype

Archetypes act as templates for new Maven projects, defining the initial configuration, along a collection of starting folders and files.

This way it is possible to quickly create a basic project, ready to be extended and adapted into your concrete need. As long as Maven is part of those needs, of course.

---

# Why this library?

I kept making all my Java projects with a very similar Maven-based structure. This meant scavenging previous projects in search of the pieces I needed, an error-prone job which is never fun nor clean.

Luckily, there are template engines, just like Archetype, which allow building the bases of a new project at the first attempt. A project which comes along all my little fetishes: CI, testing, a Maven site, reports...

Lots of things I like, and mostly consider useful, put together into a generic template, which allows creating new libraries or, with a bit of tweaking, any kind of Java project.

# An overview

Several features are offered by the archetype, the most important being:

- Unit and integration tests ready to be run, separately, with TestNG [>>](./tests.html)
- Maven site, using the Reflow skin, with documentation and reports [>>](./site.html)
- Several useful reports added to the Maven site [>>](./site.html)
- Ready to make use of Travis CI for testing and deployment [>>](./travis.html)
- Segregated development and release deployments [>>](./travis.html)
- Artifacts and documentation deployment [>>](./travis.html)
- A basic readme template.
- Gitignore and gitattributes files with a general use configuration.
- Configured for the MIT License
- Sets up the general information about the project and the developer

For configuration, the archetype makes use of a series of properties which can be set during the creation of a new project [>>](./usage.html)

Also, pay attention to the project life cycle I meant this archetype for, which will make it easier to understand [>>](./lifecycle.html)