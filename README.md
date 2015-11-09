# bashpool #

[![Build Status](https://travis-ci.org/moregeek/BashPool.svg)](https://travis-ci.org/moregeek/BashPool)


Bashpool, a collection of scripts "grown" over the past few years and are worth (IMHO) to share with you folks.

## Scripts Overview ##

| name         | sourceable | executable |          description         |
|:-------------|:----------:|:----------:|------------------------------|
| cfg          |    yes     |     yes    | ensure a specific state of user inputs such as variables and config files |
| tfp          |    yes     |     no     | prints true/false depending on return code of previously executed application |

### cfg ###

    cfg ensure a specific state of user inputs such as variables and config files.
    
    Available options: (execute only)
      -h|--help     show this help text
    
    You have two options to use cfg. The first is to source this script
    and make the cfg function available to your shell script (shell dependent).
    The second option is to modifiy your PATH to point to the location of
    this script and execute it manually (shell independent).
    
    The location of the configuration file is read from the environment variable
    CFG_CONFIG_FILE. If not set the default configuration file is loaded if
    present (~/cfg.conf).
    
    NOTE: Take extra care on the permissions of your configuration file ase there
          is no >bad behaviour< check. (yet!)
    
    usage:
    
      cfg "^/home/[a-z]+$" "/home/default" "HOME"
      # => /home/coffee
    
      HOME=/home/mate cfg "^/home/[a-z]+$" "/home/default" "HOME"
      # => /home/mate
    
      HOME="" cfg "^/home/[a-z]+$" "/home/default" "HOME"
      # => /home/default
    
      YOURVAR=$(cfg "^(true|false)$" "true" "YOURVAR")

### tfp ###

    source tfp
    
    demo="demo"; test -z $demo; tfp;          # => false
    demo=""; test -z $demo; tfp;              # => true
    ls -ald /superduper 2> /dev/null; tfp     # => false

## License ##

If not otherwise mentioned, GPLv3 applies.
