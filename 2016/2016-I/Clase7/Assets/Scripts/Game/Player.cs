using UnityEngine;
using System.Collections;
using CnControls;

public class Player : MonoBehaviour {

	// Use this for initialization
	Rigidbody2D body;
	Animator anim;
	float speed = 8f,maxVelocity = 4f;
	GameObject joystick;

	void Start () {
		body = GetComponent<Rigidbody2D> ();
		joystick = GameObject.Find ("SensitiveJoystick");
		joystick.transform.localScale = new Vector3 (0.5f, 0.5f, 0.5f);
	}

	void FixedUpdate(){
		MovePlayer ();
	}

	void MovePlayer(){
		float velocity = Mathf.Abs (body.velocity.x);
		float forceX = 0;
		float h = Input.GetAxisRaw ("Horizontal");
		float hJoystick = CnInputManager.GetAxisRaw ("Horizontal");
		if (h > 0 || hJoystick >0) {
			if (velocity < maxVelocity) {
				forceX = speed;
			}
		} else if(h<0 || hJoystick <0){
			if (velocity < maxVelocity) {
				forceX = -speed;
			}
		}
		body.AddForce (new Vector2 (forceX, 0));
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
