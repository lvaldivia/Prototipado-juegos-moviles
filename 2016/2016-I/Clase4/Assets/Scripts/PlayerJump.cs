using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class PlayerJump : MonoBehaviour {

	// Use this for initialization
	Rigidbody2D body;
	bool canJump;
	Button jumpButton;
	Animator anim;
	float jumpPower = 12f;
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
			anim.Play (JUMPING);
			body.velocity = new Vector2 (body.velocity.x, jumpPower);
		}
	}
	
	// Update is called once per frame
	void Update () {
		if (Mathf.Abs (body.velocity.y) == 0) {
			canJump = true;
			anim.Play (RUNNING);
		}
	}

	void OnCollisionEnter2D(Collision2D coll){
		
	}

	void OnTriggerEnter2D(Collider2D coll){
		anim.Play (IDLE);
	}

	void OnTriggerExit2D(Collider2D coll){
		anim.Play (RUNNING);
	}


}
