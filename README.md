# My personal dotfiles

This repository contains my personal Linux dotfiles to mantain the
same configuration in all my instalations.

It uses [Unix stow](http://www.gnu.org/software/stow/) to load all
the files in their original location.

## Example

In order to load the dotfiles of bash and vim
you must run the next command lines:

```bash
$ cd ~/dotfiles
$ stow bash
$ stow vim
```

## References

http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html

## Vim

Requires Shougo/dein.vim check instructions here https://github.com/Shougo/dein.vim
