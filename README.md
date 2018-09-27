# aria2-rpc-conf

## 概述

[Aria2](https://aria2.github.io/)是一个轻量级的多协议和多源命令行下载实用程序。 它支持HTTP / HTTPS，FTP，SFTP，BitTorrent和Metalink。 Aria2可以通过内置的JSON-RPC和XML-RPC接口进行操作。

本项目提供配置文件，用于启用Aria2的JSON-RPC功能，同时也提供一些脚本文件，用于在Windows平台下，配置Aria2 RPC环境，实现Aria2 RPC服务器的管理，以及开机自启。

在使用本项目之前，需要先安装Aria2，安装方法请查看[官网](https://aria2.github.io/)，或者使用[Scoop](https://github.com/lukesampson/scoop)来进行安装。如果已经安装了Scoop，可以在CMD执行以下命令安装Aria2：

```shell
scoop install aria2
```

Aria2是基于命令行的下载工具，没有提供GUI来对下载任务进行管理，如果需要GUI，推荐使用以下GUI：

1. [YAAW2 for Chrome](https://chrome.google.com/webstore/detail/yaaw2-for-chrome/mpkodccbngfoacfalldjimigbofkhgjn)：Chrome插件，简单易用美观，推荐使用。
2. [webui-aria2](https://github.com/ziahamza/webui-aria2)：官方推荐，纯html&js项目，直接通过浏览器运行。
3. [AriaNg](https://github.com/mayswind/AriaNg)：另一个纯html&js项目，也可以通过浏览器直接运行，YAAW2 for Chrome的界面就是基于此项目。
4. [Aria2c Integration](https://chrome.google.com/webstore/detail/aria2c-integration/cnkefpcjiolhnmhfpjbjpidgncnajlmf?hl=zh-CN)：非常轻量级的Chrome插件，提供下载拦截功能和简单的下载任务管理功能。

## 使用方法

1. 下载本仓库到本地
2. 执行`script/status.bat`，查看Aria2是否正确安装。
3. 执行`script/init.bat`，配置Aria2 RPC环境。
4. 如果要开机自启，执行`script/auto-run.bat`，输入`r`来启用自启，或输入`u`取消自启。

## 文件说明

本项目主要包含Aria2 RPC服务器的配置文件以及以及一些脚本文件：

1. `aria2.conf`：Aria2 RPC的配置文件。
2. `script/status.bat`：查看Aria2的安装情况和运行状态。
3. `script/start.vbs`：后台运行Aria2 RPC服务，运行之前会查看Aria2的日志大小，如果超过`10M`，会进行删除清理。
4. `script/start.bat`：调用`start.vbs`，后台运行Aria2 RPC服务，启动后显示Aria2的运行状态。
5. `script/stop.bat`：终止所有Aria2的运行程序。
6. `script/restart.bat`：终止所有Aria2的运行程序，并调用`start.vbs`来重启Aria2 RPC服务，启动后显示Aria2的运行状态。
7. `script/init.bat`：初始化Aria2 RPC环境，复制配置文件和所有脚本到`~/.aria2/rpc`，并创建以下文件：
   1. `aria2.cookies`：保存Aria2运行时的cookies信息，查看 [--load-cookies](https://aria2.github.io/manual/en/html/aria2c.html#cmdoption-load-cookies) 和 [--save-cookies](https://aria2.github.io/manual/en/html/aria2c.html#cmdoption-save-cookies)。
   2. `aria2.log`：Aria2日志文件，查看 [--log](https://aria2.github.io/manual/en/html/aria2c.html#cmdoption-l) 和 [--log-level](https://aria2.github.io/manual/en/html/aria2c.html#cmdoption-log-level)。
   3. `aria2.serverstat`：保存服务器性能状态，查看 [--server-stat-of](https://aria2.github.io/manual/en/html/aria2c.html#cmdoption-server-stat-of)，[--server-stat-if](https://aria2.github.io/manual/en/html/aria2c.html#cmdoption-server-stat-of) 和 [Server Performance Profile](https://aria2.github.io/manual/en/html/aria2c.html#server-performance-profile)。
   4. `aria2.session`：保存Aria2的执行情况，包括未完成或出现错误的下载任务，查看 [--input-file](https://aria2.github.io/manual/en/html/aria2c.html#cmdoption-i)，[--save-session](https://aria2.github.io/manual/en/html/aria2c.html#cmdoption-save-session) 和 [Input File](https://aria2.github.io/manual/en/html/aria2c.html#id2)。
8. `script/auto-run.bat`：配置是否开机自启。