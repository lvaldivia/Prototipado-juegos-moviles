using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class SceneFader : MonoBehaviour {

	public GameObject panel;
	public static SceneFader instance;
	Animator animation;
	void Awake(){
		if (instance != null) {
			Destroy (gameObject);
		} else {
			instance = this;
			gameObject.SetActive (false);
			animation = panel.GetComponent<Animator> ();
			DontDestroyOnLoad (gameObject);
		}
	}

	public void changeScene(string scene){
		gameObject.SetActive (true);
		StartCoroutine (fade(scene));	
	}

	IEnumerator fade(string scene){
		
		animation.Play ("fadein");
		yield return new WaitForSeconds (1f);
		SceneManager.LoadScene (scene);
		yield return new WaitForSeconds (1f);
		animation.Play ("fadeout");
		yield return new WaitForSeconds (0.8f);
		gameObject.SetActive (false);
	}

}
