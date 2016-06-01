using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class HudController : MonoBehaviour {

	// Use this for initialization
	public Text text;
	private int score;
	public static HudController instance;
	void Awake(){
		instance = this;
	}

	void Start () {
		
	}

	public void setScore(int tmpScore){
		score += tmpScore;
		PlayerPrefs.SetInt ("score", score);
		text.text = "PUNTAJE " + score;
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
