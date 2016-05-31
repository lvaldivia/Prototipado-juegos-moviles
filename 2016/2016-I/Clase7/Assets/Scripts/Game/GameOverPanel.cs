using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using Utils;

public class GameOverPanel : MonoBehaviour {

	// Use this for initialization
	public static GameOverPanel instance;
	public Text txtScore,txtCoins;
	public Button back;

	void Awake(){
		instance = this;
	}

	void Start () {
		back.onClick.AddListener (() => restartGame ());

	}

	public void updateScore(){
		txtScore.text = "Score: "+HudController.instance.score;
		txtCoins.text = Player.instance.coins.ToString ();
	}


	void restartGame(){	
		back.onClick.RemoveAllListeners ();
		if (GameSettings.life == 0) {
			SceneManager.LoadScene ("Menu");
		} else {
			SceneManager.LoadScene ("Game");
		}
	}

}
