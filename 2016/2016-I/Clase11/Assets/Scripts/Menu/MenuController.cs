using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class MenuController : MonoBehaviour {

	public Button start;
	void Start () {
		
		StartCoroutine (saveDeviceData ());
		start.onClick.AddListener (() => startGame ());
	}

	IEnumerator saveDeviceData(){	
		WWWForm form = new WWWForm ();
		form.AddField ("uid", SystemInfo.deviceUniqueIdentifier);
		form.AddField ("device_model", SystemInfo.deviceModel);
		form.AddField ("device_name", SystemInfo.deviceName);
		WWW url = new WWW ("https://clase11-1-lvaldivia.c9users.io/prueba/",form);
		yield return url;
		if (url.error == null) {
			print (url.text);
		} else {
			print (url.error);
		}
	}

	void startGame(){
		SceneManager.LoadScene ("Game");
	}

}
