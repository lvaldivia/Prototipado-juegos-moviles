using UnityEngine;
using System.Collections;

public class Scaler : MonoBehaviour {

	// Use this for initialization
	public float scale;
	void Start () {
		transform.localScale = new Vector3 (scale, scale, scale);
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
