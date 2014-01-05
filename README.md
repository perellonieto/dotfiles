My personal dotfiles

It uses Unix stow to load all the files in their original
location. To do that it is only required to run this lines:

For example, in order to load the dotfiles of bash and vim
you must run the next command lines:

$ cd ~/dotfiles
$ stow bash
$ stow vim

References:
http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
