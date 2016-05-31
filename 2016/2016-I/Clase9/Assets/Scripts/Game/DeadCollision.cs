using UnityEngine;
using System.Collections;

public class DeadCollision : MonoBehaviour {

	// Use this for initialization
	void OnTriggerEnter2D(Collider2D coll){
		Player.instance.gameOver ();
		HudController.instance.showGameOver ();
	}
}
