using UnityEngine;
using System.Collections;

public class Movement : MonoBehaviour {

	// Use this for initialization
	Rigidbody2D body;
	float speed = -5f;
	void Start () {
		body = GetComponent<Rigidbody2D> ();
	}

	void Update () {
		if (gameObject.activeInHierarchy) {
			body.velocity = new Vector2 (speed, 0);	
		}
	}
}
