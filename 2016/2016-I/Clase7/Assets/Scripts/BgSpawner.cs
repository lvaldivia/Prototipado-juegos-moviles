using UnityEngine;
using System.Collections;

public class BgSpawner : MonoBehaviour {

	private float lastY;
	private GameObject[] backgrounds;
	void Start () {
		GetLastY ();
	}
	
	void GetLastY(){
		backgrounds = GameObject.FindGameObjectsWithTag ("Bg");
		lastY = backgrounds [0].transform.position.y;

		for(int i =1 ;i<backgrounds.Length;i++){
			if (lastY > backgrounds [i].transform.position.y) {
				lastY = backgrounds [i].transform.position.y;
			}
		}
	}

	void OnTriggerEnter2D(Collider2D coll){
		if (coll.gameObject.tag == "Bg") {
			print(coll.gameObject.transform.position.y +" "+ lastY);
			if (coll.gameObject.transform.position.y == lastY) {
				Vector3 temp = coll.gameObject.transform.position;
				float height = ((BoxCollider2D)coll).size.y;
				for(int  i =0;i<backgrounds.Length;i++){
					if (!backgrounds [i].activeInHierarchy) {
						temp.y -= height;
						lastY = temp.y;
						backgrounds [i].transform.position = temp;
						backgrounds [i].SetActive (true);
					}

				}
			}
		}
	}
}
