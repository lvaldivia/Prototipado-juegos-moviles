using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class MenuController : MonoBehaviour {

	public Button start;
	void Start () {
		start.onClick.AddListener (() => startGame ());
	}

	void startGame(){
		SceneManager.LoadScene ("Game");
	}

}
