using UnityEngine;
using System.Collections;

public class BackgroundSpawner : MonoBehaviour {

	// Use this for initialization
	private GameObject[] bgs;
	private float lastY;
	void Start () {
		bgs = GameObject.FindGameObjectsWithTag ("Background");
		lastY = bgs [0].transform.position.y;
		for(int i=1;i<bgs.Length;i++){
			if (lastY > bgs [i].transform.position.y) {
				lastY = bgs [i].transform.position.y;
			}
		}
	}

	void OnTriggerEnter2D(Collider2D col){
		if (col.gameObject.transform.position.y == lastY) {
			Vector3 pos = gameObject.transform.position;
			float height = ((BoxCollider2D)col).size.y;
			for(int i=0;i<bgs.Length;i++){
				if (!bgs [i].activeInHierarchy) {
					pos.y -= height + (height/2);
					print (pos.y);
					bgs [i].transform.position = pos;
					bgs [i].SetActive (true);
					lastY = pos.y;
				}
			}
		}
	}
	

}
