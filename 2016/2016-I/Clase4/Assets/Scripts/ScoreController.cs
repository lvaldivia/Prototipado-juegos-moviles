using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class ScoreController : MonoBehaviour {

	// Use this for initialization
	public Text scoreTxt;
	float elapsed;
	int score;
	void Start () {
		score = 0;
		elapsed = 0;
		scoreTxt.text = score.ToString ();
	}
	
	// Update is called once per frame
	void Update () {
		elapsed += Time.deltaTime;
		if (elapsed >= 1f) {
			elapsed = 0;
			score++;
			scoreTxt.text = score.ToString ();
		}
	}
}
