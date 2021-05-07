# chinese-chess-with-xlua

## 项目简述

项目使用了xlua框架、[lua版PureMVC框架](https://github.com/HengyuanLee/UnityLuaPuremvc)和简易的xlua管理器等。
当前项目是一个lua版的中国象棋，主要为了练习lua的使用，目前项目正在完成中，已完成功能：主面板、难度选择面板、模式选择面板、PVP模式面板和PVP功能，待完成功能：PVE、NET联网面板的管理脚本和功能。
项目使用纯lua制作，除了必要的xlua管理器等脚本外其余代码均为lua代码。项目使用的Unity版本：2019.4.18f1。

## 项目打开注意事项

项目为Unity工程文件，使用Unity2019.4.18制作，使用Unity打开时最好使用此版本或者更高版本。资源管理器加载资源时从AB包中加载并提供了为lua脚本自动添加txt后缀和AB包名的编辑器，因此如果打开时出现问题，可以先清除xlua的生成代码，再重新使用编辑器为lua代码生成后缀和AB包名，最后使用AssetBundleManager生成AB包后重新生成xlua代码。