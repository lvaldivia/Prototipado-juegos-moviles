using UnityEngine;
using System.Collections;

public class Player : MonoBehaviour {

	// Use this for initialization
	Rigidbody2D body;
	Animator anim;
	float speed = 8f,maxVelocity = 4f;
	float localScaleX;
	void Start () {
		body = GetComponent<Rigidbody2D> ();
		localScaleX = transform.localScale.x;
	}

	void FixedUpdate(){
		MovePlayer ();
	}

	void MovePlayer(){
		float velocity = Mathf.Abs (body.velocity.x);
		float forceX = 0;
		float h = Input.GetAxisRaw ("Horizontal");
		if (h > 0) {
			if (velocity < maxVelocity) {
				forceX = speed;
			}
			transform.localScale = new Vector3 (localScaleX, transform.localScale.y, transform.localScale.z);
		} else if(h<0){
			if (velocity < maxVelocity) {
				forceX = -speed;
			}
			transform.localScale = new Vector3 (-localScaleX, transform.localScale.y, transform.localScale.z);
		}
		body.AddForce (new Vector2 (forceX, 0));
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
