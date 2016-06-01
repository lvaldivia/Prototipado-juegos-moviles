using UnityEngine;
using System.Collections;

public class Movement : MonoBehaviour {

	Rigidbody2D body;
	public float score;
	void Start () {
		body = GetComponent<Rigidbody2D> ();
	}
	
	// Update is called once per frame
	void Update () {
		if (gameObject.activeInHierarchy) {
			body.velocity = new Vector2 (body.velocity.x, -4f);
			if (transform.position.y < -Camera.main.orthographicSize) {
				gameObject.SetActive (false);
			}
		}


	}
}
