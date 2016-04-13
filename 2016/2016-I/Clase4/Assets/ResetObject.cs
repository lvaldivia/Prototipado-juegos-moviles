using UnityEngine;
using System.Collections;

public class ResetObject : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}

	void OnTriggerEnter2D(Collider2D coll){
		coll.gameObject.SetActive (false);
	}
}
