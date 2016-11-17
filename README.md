## Nerd Dinner

This is [NerdDinner](http://www.nerddinner.com), an old ASP.NET MVC app - cloned from [CodePlex](https://nerddinner.codeplex.com/SourceControl/changeset/2c36d1fc1a27d534684117ec287311fea85f800c).

It's being Dockerized to demonstrate how "legacy" ASP.NET apps can easily be packaged as [Docker](http://www.docker.com) images and run in [Windows Containers](https://msdn.microsoft.com/en-us/virtualization/windowscontainers/about/about_overview) - which is the first step in modernizing them.

### Roadmap

* [Part 1](https://blog.sixeyed.com/dockerizing-nerd-dinner-part-1-running-a-legacy-asp-net-app-in-a-windows-container/) - run the existing app in Docker with no code changes. Done in branch **dockerize-part1**;
* [Part 2](https://blog.sixeyed.com/dockerizing-nerd-dinner-part-2-connecting-asp-net-to-sql-server/) - running the database in a separate container, and using the same Docker image for different environments. Done in branch **dockerize-part2**;
* Part 3 - splitting out the homepage component as a synchronous microservice running in it's own Docker container;
* Part 4 - splitting out the create dinner component as an asynchronous microservice, running message queue and message handler containers;
* Part 5 - scaling and failover with a hybrid Docker Swarm.

Follow [@EltonStoneman](https://twitter.com/EltonStoneman) on Twitter for updates.
