#!/usr/bin/env python

import sys
import os
import shutil
import subprocess

dotfiles = os.path.dirname(os.path.dirname(__file__))

def ask_yes_no(msg, default_accept=True):
    default = ' [Y/n] ' if default_accept else ' [y/N] '
    ans = raw_input(msg + default).strip().lower()
    if default_accept:
        return ans != 'n'
    return ans == 'y'

def configure_vim(target, ask=True):
    if not ask_yes_no("Configure vim on: '{}'?".format(target)):
        return False
    copy_dot_vim(dotfiles, target, ask)
    init_vundle(target, ask)
    install_vim_plugins_with_vundle(target, ask)

def copy_dot_vim(src, dst, ask=True):
    src_vimrc = os.path.join(src, '.vimrc')
    dst_vimrc = os.path.join(dst, '.vimrc')

    src_dot_vim = os.path.join(src, '.vim')
    dst_dot_vim = os.path.join(dst, '.vim')

    if os.path.exists(dst_vimrc):
        if ask and not ask_yes_no("Replace existing vimrc on '{}'?".format(dst_vimrc)):
            raise IOError("Destination vimrc exists on '{}'".format(dst_vimrc))
        os.remove(dst_vimrc)
    shutil.copy(src_vimrc, dst_vimrc)

    if os.path.exists(dst_dot_vim):
        if ask and not ask_yes_no("Replace existing .vim on '{}'?".format(dst_dot_vim)):
            raise IOError("Destination .vim exists on '{}'".format(dst_dot_vim))
        shutil.rmtree(dst_dot_vim)
    shutil.copytree(src_dot_vim, dst_dot_vim)

def init_vundle(root, ask=True):
    dot_vim = os.path.join(root, '.vim')
    if not os.path.exists(dot_vim):
        os.mkdir(dot_vim)
    bundle_path = os.path.join(dot_vim, 'bundle')
    if not os.path.exists(bundle_path):
        os.mkdir(bundle_path)
    vundle_path = os.path.join(bundle_path, 'Vundle.vim')
    shutil.rmtree(vundle_path, True)
    subprocess.call(['git', 'clone', 'https://github.com/gmarik/Vundle.vim.git', vundle_path])

def install_vim_plugins_with_vundle(target, ask):
    vimrc = os.path.join(target, '.vimrc')
    subprocess.call(['vim', '-u', vimrc, '+PluginInstall'])

def main():
    home_path = os.path.expanduser('~')
    target = sys.argv[1] if len(sys.argv) > 1 else os.path.join(home_path, '.vim')
    return configure_vim(sys.argv[1]) and 1 or 0

if __name__ == '__main__':
    sys.exit(main())
