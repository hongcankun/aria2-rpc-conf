# aria2-rpc-conf

## Overview

[Aria2](https://aria2.github.io/) is a **lightweight** multi-protocol & multi-source command-line **download utility**. It supports **HTTP/HTTPS**, **FTP**, **SFTP**, **BitTorrent** and **Metalink**. Aria2 can be manipulated via built-in **JSON-RPC** and **XML-RPC** interfaces.

This project provides configuration files to enable Aria2's JSON-RPC function. It also provides script files for configuring the Aria2 RPC environment,  implementing Aria2 RPC server management and auto booting on the Windows platform.

Before using this project, you need to install Aria2 first. Please check [Official Website](https://aria2.github.io/) for installation, or use [Scoop](https://github.com/lukesampson/scoop) to install it. If Scoop is already installed, you can install Aria2 by executing the following command in CMD:

```shell
scoop install aria2
```

Aria2 is a command-line based download tool that does not provide a GUI to manage download tasks. If a GUI is required, the following GUI is recommended:

1. [YAAW2 for Chrome](https://chrome.google.com/webstore/detail/yaaw2-for-chrome/mpkodccbngfoacfalldjimigbofkhgjn): Chrome extension, easy to use and beautiful, recommended.
2. [webui-aria2](https://github.com/ziahamza/webui-aria2): Officially recommended, pure html & javascript project, can run directly through the browser.
3. [AriaNg](https://github.com/mayswind/AriaNg): Another pure html & javascript project that can also run directly through the browser. The YAAW2 for Chrome is based on this project.
4. [Aria2c Integration](https://chrome.google.com/webstore/detail/aria2c-integration/cnkefpcjiolhnmhfpjbjpidgncnajlmf?hl=zh-CN): Very lightweight Chrome extension with download interception and simple download task management.

## Usage

1. Download this repository to your local.
2. Run `script/status.bat` to see if Aria2 is installed correctly.
3. Run `script/init.bat` to configure the Aria2 RPC environment.
4. If you want to configure auto booting, run`script/auto-run.bat`, and type `r` to enable, or type `u` to disable.

## Description of Files

This project mainly contains the configuration file of the Aria2 RPC server and some script files:

1. `aria2.conf`: Aria2 RPC configuration file.
2. `script/status.bat`: Check the installation and running status of Aria2.
3. `script/hide-run.vbs`: Run the Aria2 RPC service in the background, and check the log size of Aria2 before running. If it exceeds `10M`, it will be cleaned up.
4. `script/start.bat`: Check whether Aria2 is already running at first, then call `hide-run.vbs` to start the Aria2 RPC service in the background and display the running status of Aria2 after startup.
5. `script/stop.bat`: Terminate all Aria2 programs.
6. `script/restart.bat`: Terminate all Aria2 programs and call `hide-run.vbs` to restart the Aria2 RPC service. After startup, the Aria2 running status is displayed.
7. `script/init.bat`: Initialize the Aria2 RPC environment, copy the configuration file and all scripts to `~/.aria2/rpc` and create the following files:
   1. `aria2.cookies`: Save the cookie information, see [--load-cookies](https://aria2.github.io/manual/en/html/aria2c.html#cmdoption-load-cookies) and [--save-cookies ](https://aria2.github.io/manual/en/html/aria2c.html#cmdoption-save-cookies).
   2. `aria2.log`: Aria2 log files, see [--log](https://aria2.github.io/manual/en/html/aria2c.html#cmdoption-l) and [--log-level](https://aria2.Github.io/manual/en/html/aria2c.html#cmdoption-log-level).
   3. `aria2.serverstat`: Keep the server performance profiles, see [--server-stat-of](https://aria2.github.io/manual/en/html/aria2c.html#cmdoption-server-stat-of),[--server- Stat-if](https://aria2.github.io/manual/en/html/aria2c.html#cmdoption-server-stat-of) and [Server Performance Profile](https://aria2.github.io/manual/en/html/aria2c.html#server-performance-profile).
   4. `aria2.session`: Save the execution status of Aria2, including unfinished or erroneous download tasks, see [--input-file](https://aria2.github.io/manual/en/html/aria2c.html#cmdoption-i), [--save-session](https://aria2.github.io/manual/en/html/aria2c.html#cmdoption-save-session) and [Input File](https://aria2.github.io/manual/en/html/aria2c.html#id2).
8. `script/auto-run.bat`: Configure whether or not enable auto booting.

