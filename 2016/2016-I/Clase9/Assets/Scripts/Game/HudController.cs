using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using Utils;


public class HudController : MonoBehaviour {

	public GameObject ready;
	private Button readyBtn;
	public GameObject goGameOverPanel;
	public Button pauseButton;
	public GameObject goPausePanel;
	public Text scoreTxt, coinsTxt, lifeTxt;
	public float score;

	public static HudController instance;

	void Awake(){
		instance = this;
	}

	void Start () {
		readyBtn = ready.GetComponent<Button> ();
		readyBtn.onClick.AddListener (() => activateGame ());
		goGameOverPanel.SetActive (false);
		goPausePanel.SetActive (false);
		coinsTxt.text = "Coins: 0";
		scoreTxt.text = "Score: 0";
		lifeTxt.text = GameSettings.life.ToString();
	}

	public void updateScore(){
		score++;
		scoreTxt.text = "Score: " + score;
	}

	public void updateCoins(int coins){
		coinsTxt.text ="Coins "+ coins;
	}

	void activateGame(){
		readyBtn.onClick.RemoveAllListeners ();
		pauseButton.onClick.AddListener (() => pauseGame ());
		ready.SetActive (false);
		CameraMovement.instance.moveCamera = true;
		Player.instance.changeAnimation (Player.RUNNING);
		Player.instance.activateJoystick ();
	}

	public void pauseGame(){
		Time.timeScale = Time.timeScale == 1 ? 0 : 1;
		goPausePanel.SetActive (!goPausePanel.activeInHierarchy ? true : false);
	}

	public void showGameOver(){
		pauseButton.onClick.RemoveAllListeners ();
		goGameOverPanel.SetActive (true);
		GameOverPanel.instance.updateScore ();
	}

}
