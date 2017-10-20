# fishnet
Make it super easy to install fish plugins in their own private directories. It basically autoloads all the fish plugins from a directory called `bundle` under you fish configuration folder.

## Installation

You can either clone the repo to the folder mentioned below or download the repo to there

```bash
$ cd ~/.config/fish/bundle
$ git clone git://github.com/pksunkara/fishnet.git
```

## Usage

Add the following to your `config.fish`

```bash
source $HOME/.config/fish/bundle/fishnet/init.fish
```

Now any plugins you wish to install can be extracted to a subdirectory under `~/.config/fish/bundle`, and they will be automatically autoloaded. Observe:

```bash
$ cd ~/.config/fish/bundle && git clone git://github.com/fisherman/get
```

Now [get](https://github.com/fisherman/get) is installed. If you really want to get crazy, you could set it up as a submodule in whatever repository you keep your dot files in. I am crazy and am doing that which is why I wrote this in the first place with inspiration from [pathogen](https://github.com/tpope/vim-pathogen). You can even set this repo as a submodule.

If you like this project, please watch this and follow me.

## Contributors
Here is a list of [Contributors](http://github.com/pksunkara/fishnet/contributors)

### TODO

__I accept pull requests and guarantee a reply back within a day__

## License
MIT/X11

## Bug Reports
Report [here](http://github.com/pksunkara/fishnet/issues). __Guaranteed reply within a day__.

## Contact
Pavan Kumar Sunkara (pavan.sss1991@gmail.com)

Follow me on [github](https://github.com/users/follow?target=pksunkara), [twitter](http://twitter.com/pksunkara)
