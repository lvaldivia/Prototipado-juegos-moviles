using UnityEngine;	
using System.Collections;
using UnityEngine.SceneManagement;
using Utils;

public class GameManager : MonoBehaviour {

	// Use this for initialization
	public static GameManager instance;

	void Awake(){
		if (instance != null) {
			Destroy (gameObject);
		} else {
			instance = this;
			DontDestroyOnLoad (gameObject);
		}
	}

	public void changeScene(string scene){
		SceneFader.instance.changeScene (scene);
	}

	void Update () {
		if (Input.GetKeyDown (KeyCode.Escape)) {
			Time.timeScale = Time.timeScale == 0 ? 1 : Time.timeScale;
			print (SceneManager.GetActiveScene ().name);
			switch (SceneManager.GetActiveScene ().name) {
				case "HighScore":
				case "Options":
				case "Game":
					SceneManager.LoadScene ("Menu");
					break;
				case "Menu":
					Application.Quit ();
						break;
			}
		}
	}
}
