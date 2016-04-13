using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class PanelController : MonoBehaviour {

	// Use this for initialization
	public Button menu;
	public Button game;
	ButtonController controller;
	void Start () {
		controller = GameObject.Find ("Main Camera").
			GetComponent<ButtonController> ();
		menu.onClick.AddListener (() => goMenu ());
		game.onClick.AddListener (() => goBack ());
	}

	void goMenu(){
		Time.timeScale = 1f;
		SceneManager.LoadScene ("Menu");
	}

	void goBack(){
		controller.pauseGame ();
	}
		
}
