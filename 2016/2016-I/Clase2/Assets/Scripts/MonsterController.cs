using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class MonsterController : MonoBehaviour {

	public GameObject[] elements;
	List<GameObject> monsters;
	float elapsed;
	void Start () {
		monsters = new List<GameObject> ();
		initMonsters();
		elapsed = 0;
	}

	void initMonsters(){
		int total = elements.Length * 5;
		for(int i = 0;i<total;i++){
			int index = Random.Range (0, elements.Length);
			GameObject go = Instantiate (elements [index],
				                transform.position, 
				transform.rotation) as GameObject;
			print (go);
			monsters.Add (go);
			go.SetActive (false);
			
		}
	}
	
	// Update is called once per frame
	void Update () {
		elapsed += Time.deltaTime;
		if (elapsed >= 1.5f) {
			elapsed = 0;
			print ("callmonster");
			callMonster ();
		}
	}

	void callMonster(){
		int index = Random.Range (0, monsters.Count);
		if (!monsters [index].activeInHierarchy) {
			monsters [index].SetActive (true);
			monsters [index].transform.position = 
				new Vector3 (transform.position.x,
				transform.position.y, transform.position.z);
		}
	}
}
