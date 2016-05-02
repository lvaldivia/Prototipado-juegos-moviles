using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class PlayerJump : MonoBehaviour {

	// Use this for initialization
	Rigidbody2D body;
	bool canJump;
	Button jumpButton;
	Animator anim;
	float jumpPower = 16f;
	const string RUNNING = "running";
	const string JUMPING = "jumping";
	const string IDLE = "iddle";

	void Start () {
		body = GetComponent<Rigidbody2D> ();
		jumpButton = GameObject.Find ("jumpStart").GetComponent<Button>();
		anim = GetComponent<Animator> ();
		anim.Play (RUNNING);
		jumpButton.onClick.AddListener (() => jump ());
		canJump = false;
	}

	void jump(){
		if (canJump) {
			canJump = false;
			float forwardForce = 0f;
			if (transform.position.x < 0) {
				forwardForce = 2f;
			}
			anim.Play (JUMPING);
			print (forwardForce);
			body.velocity = new Vector2 (forwardForce, jumpPower);
		}
	}
	
	// Update is called once per frame
	void Update () {
		if (Mathf.Abs (body.velocity.y) == 0) {
			canJump = true;
			anim.Play (RUNNING);
		}
	}
}
