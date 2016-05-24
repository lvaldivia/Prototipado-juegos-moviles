using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class MenuController : MonoBehaviour {

	// Use this for initialization
	public Button start,options, highScore, quit;
	void Start () {
		start.onClick.AddListener (() => login ());
		options.onClick.AddListener (() => goScene ("Options"));
		highScore.onClick.AddListener (() => goScene ("HighScore"));
		quit.onClick.AddListener (() => quitApp ());
	}

	void login(){
		FacebookController.instance.login ();
		//SceneManager.LoadScene ("Game");
	}

	void goScene(string scene){
		SceneManager.LoadScene (scene);
	}

	void quitApp(){
		Application.Quit ();
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}

