using UnityEngine;
using System.Collections;
using UnityEngine.SceneManagement;

public class PlayerMovement : MonoBehaviour {

	// Use this for initialization
	Rigidbody2D body;
	private float maxVelocity = 4f;
	private float speed = 4f;
	private int life;
	private float maxX,minX;
	void Start () {
		life = GameObject.FindGameObjectsWithTag ("life").Length;
		body = GetComponent<Rigidbody2D> ();
		setBoundsXY ();
	}
	
	// Update is called once per frame
	void Update () {
		if (Input.GetKey (KeyCode.LeftArrow)) {
			body.velocity = new Vector2 (-speed, body.velocity.y);	
		}
		else if (Input.GetKeyUp (KeyCode.LeftArrow)) {
			body.velocity = new Vector2 (0, body.velocity.y);
		}
		if (Input.GetKey (KeyCode.RightArrow)) {
			body.velocity = new Vector2 (speed, body.velocity.y);	
		}
		else if (Input.GetKeyUp (KeyCode.RightArrow)) {
			body.velocity = new Vector2 (0, body.velocity.y);
		}
		Vector3 tmp = transform.position;
		if (tmp.x > maxX) {
			tmp.x = maxX;
		}
		if (tmp.x < minX) {
			tmp.x = minX;
		}
		transform.position = tmp;
	}

	void setBoundsXY(){
		Vector3 bounds = Camera.main.ScreenToWorldPoint (new Vector3 (
			Screen.width, Screen.height, 0));
		maxX = bounds.x - 0.5f;
		minX = -bounds.x + 0.5f;
	}

	void OnTriggerEnter2D(Collider2D coll){
		coll.gameObject.SetActive (false);
		life--;
		GameObject.FindGameObjectWithTag ("life").SetActive (false);
		if (life == 0) {
			SceneManager.LoadScene ("GameOver");	
		}
	}
}
