using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;
using System.IO;

public class LuaFileLoader : MonoBehaviour
{
    LuaEnv luaenv = null;
    void Awake()
    {
        luaenv = new LuaEnv();
        luaenv.AddLoader((ref string filename) => {
            string luaf = string.Format("{0}/Lua/{1}.lua", Application.dataPath, filename);
            if (File.Exists(luaf))
            {
                string luaTxt = File.ReadAllText(luaf);
                return System.Text.Encoding.UTF8.GetBytes(luaTxt);
            }
            else
            {
                Debug.LogError("找不到lua文件： " + luaf);
            }
            return null;
        });
        luaenv.DoString("require 'Main' Main()");
    }
}
