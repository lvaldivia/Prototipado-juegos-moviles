using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class GameOver : MonoBehaviour {

	public Button continuar;
	public Text text;
	void Start () {
		text.text ="Max score "+ PlayerPrefs.GetInt ("score", 0);
		continuar.onClick.AddListener (() => goGame ());
	}

	void goGame(){
		continuar.onClick.RemoveAllListeners ();
		SceneManager.LoadScene ("Game");
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
