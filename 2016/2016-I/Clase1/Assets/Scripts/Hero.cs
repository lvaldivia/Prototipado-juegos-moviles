using UnityEngine;
using System.Collections;

public class Hero : MonoBehaviour {

	// Use this for initialization
	int dir  = -1;
	public float speed;
	public float bounce;
	public float increase;
	float tmpBounce;
	float scaleX;
	void Start () {
		tmpBounce = 1;
		scaleX = transform.localScale.x;
	}
	
	// Update is called once per frame
	void Update () {
		/*Vector3 position = transform.position;
		if (position.x > 5 || position.x < -5) {
			dir *= -1;
			scaleX *= -1;
			transform.localScale = new Vector3 (scaleX,
				transform.localScale.y,
				transform.localScale.z);
			//tmpBounce++;
		}
		if (tmpBounce % bounce == 0) {
			speed += increase;
		}
		position.x += speed*dir*Time.deltaTime;
		transform.position = position;*/

	}
}
