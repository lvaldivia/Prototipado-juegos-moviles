using UnityEngine;
using System.Collections;

public class Player : MonoBehaviour {

	// Use this for initialization
	Animator animation;
	Rigidbody2D body;
	float minX,maxX;
	void Start () {
		setMinMax ();
		animation = GetComponent<Animator> ();
		body = GetComponent<Rigidbody2D> ();
		transform.localScale = new Vector3 (3f, 3f, 3f);
		Screen.sleepTimeout = SleepTimeout.NeverSleep;
	}

	void setMinMax(){
		Vector3 bounds = Camera.main.ScreenToWorldPoint (new Vector3 (
			Screen.width, Screen.height, 0));
		maxX = bounds.x - 0.5f;
		minX = -bounds.x + 0.5f;
		#if UNITY_EDITOR
		print("solo se llama en el editor");
		#endif
	}

	void Update () {
		//#if UNITY_ANDROID

		//#endif
		float dir = Input.acceleration.x;
		float forceX = 0;
		if (dir > 0.1f) {
			forceX = 2f;
		}else if(dir <-0.1f){
			forceX = -2f;
		}

		if (Input.GetKey (KeyCode.LeftArrow)) {
			forceX = -2f;
		}else if(Input.GetKey(KeyCode.RightArrow)){
			forceX = 2f;
		}
		body.velocity = new Vector2 (forceX, body.velocity.y);
		Vector3 tmp = transform.position;
		if (tmp.x > maxX) {
			tmp.x = maxX;
		}else if(tmp.x<minX){
			tmp.x = minX;
		}
		transform.position = tmp;
	}
}
