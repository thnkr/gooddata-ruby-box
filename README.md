GoodData Ruby Box
=================
A configuration script to set up your Ruby environment for use with the GoodData Ruby SDK.

## Prerequisites
- Ruby 1.9.3 (or above)
- GoodData username and password. 
- [GoodData Developer Token](https://developer.gooddata.com/trial/).

## Install: Nitrous.io Linux "Hack" Box
Nitrous.io allows you to boot a small private linux machine in the cloud called a Hack Box.

```html
<a href="https://www.nitrous.io/hack_button?source=embed&runtime=rails&repo=thnkr%2Fgooddata-ruby-box&file_to_open=README.md" style="border:0;text-decoration:none"><img src="https://d3o0mnbgv6k92a.cloudfront.net/assets/hack-s-v1-19458b540eb9a0b6a943ee6d27941699.png" alt="Hack thnkr/gooddata-ruby-box on Nitrous.IO" /></a>
```html

Then run the builder script:

    ruby workspace/gooddata-ruby-box/builder.rb
    
## Install: Local Machine
To start the builder, open Terminal and download this repository with this command:

    git clone https://github.com/thnkr/gooddata-ruby-box

Then run the builder script:

    ruby gooddata-ruby-box/builder.rb
    
Optionally you can pass the script your credentials and token:

    ruby gooddata-ruby-box/builder.rb USERNAME PASSWORD TOKEN
    
## Functionality
The builder installs a demo GoodData project on your local machine and a pushes it to the GoodData platform.  The example project "My Ruby SDK Project" includes data, models, a blueprint and three datasets:

- Devs
- Commits
- Repos

The resulting demo project directory tree:
    
    -- Goodfile
    -- model
       -- model.rb
    -- data
       -- commits.csv
       -- devs.csv
       -- repos.csv

For questions or support contact expert.services@gooddata.com or visit the [support](http://gooddata-sdk.uservoice.com/forums/251337-general) page. 

## Successful Builds
- Mac OS X (Mavericks: 10.9.3)
- Ubuntu 14.04 LTS (Trusty Tahr)

For more information about the GoodData Ruby SDK visit the dedicated developer [site](http://sdk.gooddata.com/gooddata-ruby).
