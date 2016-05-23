using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class MenuController : MonoBehaviour {

	// Use this for initialization
	public Button starButton, optionsButton, quitButton, highScoreButton;
	void Start () {
		starButton.onClick.AddListener (() => goGame ());
		optionsButton.onClick.AddListener (() => goOptions ());
		quitButton.onClick.AddListener (() => goQuit ());
		highScoreButton.onClick.AddListener (() => goHighScore ());
	}
	
	void goGame(){
		SceneManager.LoadScene ("Game");
	}

	void goOptions(){
		SceneManager.LoadScene ("Options");	
	}

	void goQuit(){
		Application.Quit ();
	}

	void goHighScore(){
		SceneManager.LoadScene ("HighScore");	
	}
}
