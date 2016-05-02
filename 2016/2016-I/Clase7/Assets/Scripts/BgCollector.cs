using UnityEngine;
using System.Collections;

public class BgCollector : MonoBehaviour {

	void OnTriggerEnter2D(Collider2D coll){
		print (coll.gameObject.tag);
		if (coll.gameObject.tag == "Bg") {
			coll.gameObject.SetActive (false);
		}
	}
}
