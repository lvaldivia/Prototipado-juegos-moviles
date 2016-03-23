using UnityEngine;
using System.Collections;

public class Movement : MonoBehaviour {

	// Use this for initialization
	public float speed;
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		Vector3 position = transform.position;
		if(Input.GetKey(KeyCode.A)){
			position.x -= speed * Time.deltaTime;
		}
		if (Input.GetKey (KeyCode.D)) {
			position.x += speed*Time.deltaTime;
		}

		transform.position = position;
	}
}
