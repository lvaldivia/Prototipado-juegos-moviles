using UnityEngine;
using System.Collections;

public class Movement : MonoBehaviour {

	// Use this for initialization
	Rigidbody2D body;
	public float speed = -3f;
	void Start () {
		body = GetComponent<Rigidbody2D> ();
	}
	
	// Update is called once per frame
	void Update () {
		if (gameObject.activeInHierarchy) {
			body.velocity = new Vector2 (speed, 0);
		}
	}
}
