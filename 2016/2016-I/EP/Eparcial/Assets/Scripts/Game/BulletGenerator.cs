using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class BulletGenerator : MonoBehaviour {

	public GameObject bullet;
	private List<GameObject> bullets;
	private float elapsed;
	void Start () {
		bullets = new List<GameObject> ();
		for (int i = 0; i < 60; i++) {
			GameObject go = Instantiate (bullet, transform.position, transform.rotation) as GameObject;
			go.SetActive (false);
			bullets.Add (go);
		}
	}
	
	// Update is called once per frame
	void Update () {
		elapsed += Time.deltaTime;
		if (Input.GetKeyDown (KeyCode.Space)) {
			if (elapsed >= 0.5) {
				elapsed = 0;
				getBullet ();
			}
		}
	}

	void getBullet(){
		int random = Random.Range (0, bullets.Count);
		while (true) {
			if (!bullets [random].activeInHierarchy) {
				bullets [random].transform.position = new Vector3 (transform.position.x, transform.position.y, transform.position.z);
				bullets [random].SetActive (true);
				break;
			} else {
				random = Random.Range (0, bullets.Count);
			}
		}
	}
}
