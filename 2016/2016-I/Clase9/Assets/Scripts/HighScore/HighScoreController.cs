using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class HighScoreController : MonoBehaviour {

	// Use this for initialization
	public Button back;
	public Text score;
	public Text coins;
	void Start () {
		back.onClick.AddListener (() => goBack ());
	}

	void goBack(){
		back.onClick.RemoveAllListeners ();
		SceneManager.LoadScene ("Menu");
	}
}
