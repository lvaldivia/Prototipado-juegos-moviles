using UnityEngine;
using System.Collections;
using CnControls;
using Utils;

public class Player : MonoBehaviour {

	Rigidbody2D body;
	Animator anim;
	float speed = 8f,maxVelocity = 4f;
	public const string IDDLE = "player_iddle";
	public const string RUNNING = "player_walking";
	public static Player instance;
	public GameObject joystick;
	private float posY;

	public int life;
	public int coins;

	void Awake(){
		instance = this;
		joystick.SetActive (false);
		life = GameSettings.life;
	}

	void Start () {
		body = GetComponent<Rigidbody2D> ();
		anim = GetComponent<Animator> ();
		posY = transform.position.y;
	}

	void FixedUpdate(){
		MovePlayer ();
	}

	public void activateJoystick(){
		joystick.SetActive (true);
	}

	public void changeAnimation(string animation){
		anim.Play (animation);
	}

	void MovePlayer(){
		float velocity = Mathf.Abs (body.velocity.x);
		float forceX = 0;
		float h = Input.GetAxisRaw ("Horizontal");
		float hJoystick = CnInputManager.GetAxis ("Horizontal");
		Vector3 localScale = transform.localScale;
		if (h > 0 || hJoystick > 0) {
			if (velocity < maxVelocity) {
				forceX = speed;
				localScale.x = 1f;
			}
		} else if(h<0 || hJoystick< 0){
			if (velocity < maxVelocity) {
				forceX = -speed;
				localScale.x = -1f;
			}
		}
		transform.localScale = localScale;
		body.AddForce (new Vector2 (forceX, 0));
	}

	void Update(){
		if (Time.timeScale > 0) {
			if (CameraMovement.instance.moveCamera) {
				HudController.instance.updateScore ();
			}	
		}
	}

	public void gameOver(){
		CameraMovement.instance.moveCamera = false;
		gameObject.SetActive (false);
		life--;
		GameSettings.life = life;
	}
}
