using UnityEngine;
using System.Collections;

public class CloudCollector : MonoBehaviour {

	void OnTriggerEnter2D(Collider2D coll){
		if (coll.gameObject.tag == "Cloud" 
			|| coll.gameObject.tag == "Deadly") {
			coll.gameObject.SetActive (false);
		}
	}
}
