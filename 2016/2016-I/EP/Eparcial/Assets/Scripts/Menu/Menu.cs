using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class Menu : MonoBehaviour {

	// Use this for initialization
	[SerializeField]
	private Button start;
	void Start () {
		start.onClick.AddListener (() => startGame ());
	}

	void startGame(){
		start.onClick.RemoveAllListeners ();
		SceneManager.LoadScene ("Game");
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
