using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class PausePanel : MonoBehaviour {

	public Button continueGame, quitGame;
	void Start () {
		continueGame.onClick.AddListener (() => continueMyGame ());
		quitGame.onClick.AddListener (() => quitApp ());
	}
	
	void continueMyGame(){
		HudController.instance.pauseGame ();
	}

	void quitApp(){
		Application.Quit ();
	}
}
