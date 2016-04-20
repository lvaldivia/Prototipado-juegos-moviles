using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class StartGame : MonoBehaviour {

	// Use this for initialization
	FacebookController controller;
	Button button;
	void Start () {
		controller = GameObject.Find ("Main Camera").GetComponent<FacebookController> ();
		button = GetComponent<Button> ();
		button.onClick.AddListener (() => logInApp ());
	}

	void logInApp(){
		//button.onClick.RemoveAllListeners ();
		controller.login ();
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
