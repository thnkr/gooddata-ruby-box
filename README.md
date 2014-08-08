GoodData Ruby Box
=================
A configuration script to set up your Ruby environment for use with the GoodData Ruby SDK.

## Prerequisites
- Ruby 1.9.3 (or above)
- GoodData username and password. 
- [GoodData Developer Token](https://developer.gooddata.com/trial/).

## Use
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
