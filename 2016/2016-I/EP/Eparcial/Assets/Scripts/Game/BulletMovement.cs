using UnityEngine;
using System.Collections;

public class BulletMovement : MonoBehaviour {

	// Use this for initialization
	Rigidbody2D body;
	void Start () {
		body = GetComponent<Rigidbody2D> ();
	}
	
	// Update is called once per frame
	void Update () {
		body.velocity = new Vector2 (body.velocity.x, 5f);
		if (transform.position.y > Camera.main.orthographicSize) {
			gameObject.SetActive (false);
		}	
	}

	void OnTriggerEnter2D(Collider2D coll){
		coll.gameObject.SetActive (false);
		int score = 10;
		if (coll.gameObject.tag == "enemy2") {
			score = 20;
		}
		if (coll.gameObject.tag == "enemy3") {
			score = 30;
		}

		HudController.instance.setScore (score);
		gameObject.SetActive (false);
	}
}
