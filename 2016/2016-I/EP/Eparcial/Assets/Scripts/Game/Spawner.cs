using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class Spawner : MonoBehaviour {

	// Use this for initialization
	private float maxX,minX;
	public GameObject[] elements;
	public int duplicate = 3;
	private List<GameObject> enemyes;
	private float elapsed;
	void Start () {
		enemyes = new List<GameObject> ();
		int max = 0;
		setBoundsXY ();
		for (int i = 0; i < elements.Length*duplicate; i++) {
			GameObject go = Instantiate (elements [max], transform.position, transform.rotation) as GameObject;
			enemyes.Add (go);
			go.SetActive (false);
			max++;
			if (max == elements.Length) {
				max = 0;
			}
		}
	}
	
	// Update is called once per frame
	void Update () {
		elapsed += Time.deltaTime;
		if (elapsed >= 1f) {
			elapsed = 0;
			generateEnemys ();
		}
	}

	void setBoundsXY(){
		Vector3 bounds = Camera.main.ScreenToWorldPoint (new Vector3 (
			Screen.width, Screen.height, 0));
		maxX = bounds.x - 0.5f;
		minX = -bounds.x + 0.5f;
	}

	void generateEnemys(){
		int random = Random.Range (0, enemyes.Count);
		while (true) {
			if (!enemyes [random].activeInHierarchy) {
				BoxCollider2D collider = enemyes [random].GetComponent<BoxCollider2D> ();
				float posX = Random.Range (minX, maxX);
				enemyes [random].transform.position = new Vector3 (posX, transform.position.y, transform.position.z);
				enemyes [random].SetActive (true);
				break;
			} else {
				random = Random.Range (0, enemyes.Count);
			}
		}
	}
}
