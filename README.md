#VIM

## 目的

用 VIM 有一段时间了，每次换电脑都需要重新配置自己的 VIM，所以把 VIM
的配置信息存储一下，后面方便一键自动化配置。

利用 Git 子模块的方式，将这些配置、插件进行存放。

## 如何一键安装配置和插件？

确保已经正确安装了 `8.0` 以上版本的 VIM，然后执行下列代码即可

```sh
# Github 地址
git clone git@github.com:MinsonLee/vim.git ~/.vim --recurse-submodules --remote-submodules

# Gitee 地址
git clone git@gitee.com:minson-lee/vim.git ~/.vim --recurse-submodules --remote-submodules
```

## 已安装插件列表

没有想过将 VIM 打造成一个强大的 IDE
工具，此处只是将自己使用比较多且比较好用的插件进行了管理。

- [vim-plug](https://github.com/junegunn/vim-plug/branches) : VIM 插件管理包
- [nerdtree](https://github.com/preservim/nerdtree.git) : 树形目录
- [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides):
  代码对齐线
