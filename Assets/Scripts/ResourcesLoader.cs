using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ResourcesLoader : MonoBehaviour
{
    public static ResourcesLoader Instance;
    public Transform canvas;
    private void Awake()
    {
        Instance = this;
        canvas = GameObject.Find("Canvas").transform;
    }

    public GameObject LoadPanel(string name)
    {
        name = name;
        GameObject prefab = Resources.Load<GameObject>(name);
        if (prefab == null) {
            Debug.LogError("加载prefab失败:"+name);
        }
        return GameObject.Instantiate(prefab, canvas);
    }
}
