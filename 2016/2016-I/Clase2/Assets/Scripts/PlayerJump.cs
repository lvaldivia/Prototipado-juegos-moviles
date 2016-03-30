using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class PlayerJump : MonoBehaviour {

	// Use this for initialization
	Rigidbody2D body;
	bool canJump;
	Button jumpButton;
	float jumpPower = 12f;
	void Start () {
		body = GetComponent<Rigidbody2D> ();
		jumpButton = GameObject.Find ("jumpStart").GetComponent<Button>();
		jumpButton.onClick.AddListener (() => jump ());
		canJump = false;
	}

	void jump(){
		if (canJump) {
			canJump = false;
			body.velocity = new Vector2 (body.velocity.x, jumpPower);
		}
	}
	
	// Update is called once per frame
	void Update () {
		if (Mathf.Abs (body.velocity.y) == 0) {
			canJump = true;
		}
	}
}
