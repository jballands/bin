# bin

Useful scripts that I use across my macOS system. Feel free to use them.

## Recommended Setup

> You can do whatever you want here. This is just how I like to set this up. After all, they're just shell scripts...

Clone this repo into `~/bin`, `cd` into it, then make all scripts executable:

```sh
cd ~
git clone git@github.com:jballands/bin.git
cd bin
chmod u=rwx,g=rx,o=rx *.sh
```

Then in your `.zshrc`, add `~/bin` to your `$PATH`:

```
export PATH=/usr/local/bin:...:~/bin/:...
```

Then restart your shell:

```sh
. ~/.zshrc
```

You can now execute any of these shell scripts anywhere on your system. For example:

```sh
listening.sh
```

## Readmes

Some scripts come with READMEs to provide further documeentation. For example, the `mitmproxy.md` file is the README for the `mitmproxy.sh` script.
