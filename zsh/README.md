# Structure

`zshrc` should be aliased to your main .zshrc

There is specific aliases and path things (programs that should be present in your `PATH`) depending if your are on Linux or MacOS

Any local config that should never be versioned should belong in `conf/conf.local`, its loading appends after everything, except the prompt display because it customize itself based on `ZDOTCOLOR` 

Made with :heart: by Showner