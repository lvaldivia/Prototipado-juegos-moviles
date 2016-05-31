using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using Utils;

public class MenuController : MonoBehaviour {

	// Use this for initialization
	public Button start,options, highScore, quit;
	void Start () {
		//start.onClick.AddListener (() => login ());
		GameSettings.life = 3;
		start.onClick.AddListener (() => goScene ("Game"));
		options.onClick.AddListener (() => goScene ("Options"));
		highScore.onClick.AddListener (() => goScene ("HighScore"));
		quit.onClick.AddListener (() => quitApp ());
	}

	void login(){
		FacebookController.instance.login ();
	}

	void goScene(string scene){
		start.onClick.RemoveAllListeners();
		options.onClick.RemoveAllListeners();
		highScore.onClick.RemoveAllListeners();
		quit.onClick.RemoveAllListeners();
		GameManager.instance.changeScene (scene);
	}

	void quitApp(){
		Application.Quit ();
	}

}

