using UnityEngine;
using System.Collections;

public class PlayerBounds : MonoBehaviour {

	private float maxX,minX;
	void Start () {
		setBoundsXY ();
	}

	void setBoundsXY(){
		Vector3 bounds = Camera.main.ScreenToWorldPoint (new Vector3 (
			Screen.width, Screen.height, 0));
		maxX = bounds.x - 0.5f;
		minX = -bounds.x + 0.5f;
	}
	
	// Update is called once per frame
	void Update () {
		if (transform.position.x < minX) {
			transform.position = new Vector3 (minX, transform.position.y, transform.position.z);
		}
		if (transform.position.x > maxX) {
			transform.position = new Vector3 (maxX, transform.position.y, transform.position.z);
		}
	}
}
